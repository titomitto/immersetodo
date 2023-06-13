import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:immersetodo/utils/utils.dart';
import 'package:immersetodo/widgets/primary_button.dart';

import '../../tasks.dart';
import '../controllers/task_controller.dart';
import '../states/task_state.dart';

class AddTaskForm extends ConsumerStatefulWidget {
  const AddTaskForm({
    super.key,
  });

  @override
  ConsumerState<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends ConsumerState<AddTaskForm> {
  final formKey = GlobalKey<FormState>();
  final taskTitleController = TextEditingController();

  void submit() {
    final taskController = ref.read(taskProvider.notifier);
    taskController.saveTask(taskTitleController.text.trim());
  }

  String? mapValidationFailureToMessage(context, ValidationFailure? failure) {
    if (failure is EmptyFieldFailure) {
      return "Please enter a task title";
    }

    if (failure != null) {
      return failure.toMessage(context);
    }

    return null;
  }

  void navigateBack() {
    context.pop();
  }

  @override
  void dispose() {
    super.dispose();
    taskTitleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(taskProvider, (prevState, state) {
      if (state is TaskAdded) {
        navigateBack();
      }
    });

    var state = ref.watch(taskProvider);
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: taskTitleController,
            maxLines: 3,
            validator: (value) {
              final failure = TaskValidator.validateTitle(value!);
              return mapValidationFailureToMessage(context, failure);
            },
            decoration: const InputDecoration(
              hintText: "Task Title",
              hintStyle: TextStyle(
                color: Color(0xff565765),
              ),
              filled: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          PrimaryButton(
              isLoading: state is TaskSaving,
              onTap: () {
                if (formKey.currentState!.validate()) submit();
              },
              title: "Save Task"),
        ],
      ),
    );
  }
}
