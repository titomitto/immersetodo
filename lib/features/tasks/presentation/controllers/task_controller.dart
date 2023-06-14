import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:immersetodo/features/tasks/tasks.dart';

import '../../domain/domain.dart';
import '../states/task_state.dart';

class TaskController extends StateNotifier<TaskState> {
  AddTask addTask;
  TaskController({
    required this.addTask,
  }) : super(TaskInitial());

  void saveTask(String title, String description) async {
    state = TaskSaving();
    var response =
        await addTask(AddTaskParams(title: title, description: description));
    await response.fold((failure) {
      state = TaskFailed(failure);
    }, (success) async {
      state = TaskAdded();
    });
  }
}

final taskProvider =
    StateNotifierProvider.autoDispose<TaskController, TaskState>((ref) {
  AddTask addTask = ref.watch(addTaskUseCaseProvider);

  return TaskController(
    addTask: addTask,
  );
});
