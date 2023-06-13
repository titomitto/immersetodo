import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/failure.dart';
import '../../tasks.dart';
import '../controllers/task_controller.dart';
import '../states/task_state.dart';
import 'empty_view.dart';
import 'error_view.dart';
import 'task_view.dart';

class TasksListView extends ConsumerStatefulWidget {
  const TasksListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TasksListViewState();
}

class _TasksListViewState extends ConsumerState<TasksListView> {
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(tasksProvider);

    ref.listen(taskProvider, (previous, next) {
      if (next is TaskAdded || next is TaskDeleted || next is TaskUpdated) {
        ref.read(tasksProvider.notifier).getTasks();
      }
    });

    if (state is TasksLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is TasksError) {
      return ErrorView(message: mapFailureToMessage(context, state.failure));
    }

    if (state is TasksEmpty) {
      return const EmptyView();
    }

    if (state is TasksData) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: state.tasks.length,
          itemBuilder: (context, index) {
            var task = state.tasks[index];
            return TaskView(task: task);
          },
        ),
      );
    }

    return Container();
  }
}
