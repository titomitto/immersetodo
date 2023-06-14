import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:immersetodo/utils/utils.dart';
import 'package:immersetodo/widgets/primary_button.dart';

import '../../../../config/styles.dart';
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
  final taskDescriptionController = TextEditingController();

  void submit() {
    final taskController = ref.read(taskProvider.notifier);
    taskController.saveTask(
        taskTitleController.text.trim(), taskDescriptionController.text.trim());
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
            validator: (value) {
              final failure = TaskValidator.validateTitle(value!);
              return mapValidationFailureToMessage(context, failure);
            },
            decoration: InputDecoration(
              hintText: "Enter Title",
              hintStyle: const TextStyle(
                color: Color(0xff565765),
              ),
              labelText: "Title",
              isDense: true,
              filled: true,
              border: defaultInputBorder,
              enabledBorder: defaultInputBorder,
              focusedBorder: defaultInputBorder,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: taskDescriptionController,
            maxLines: 3,
            validator: (value) {
              // final failure = TaskValidator.validateDescription(value!);
              return null; //mapValidationFailureToMessage(context, failure);
            },
            decoration: InputDecoration(
              labelText: "Description",
              hintText: "Enter Description",
              hintStyle: const TextStyle(
                color: Color(0xff565765),
              ),
              filled: true,
              border: defaultInputBorder,
              enabledBorder: defaultInputBorder,
              focusedBorder: defaultInputBorder,
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
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
