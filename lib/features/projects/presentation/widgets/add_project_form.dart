import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:immersetodo/utils/utils.dart';
import 'package:immersetodo/widgets/primary_button.dart';

import '../../../projects/domain/domain.dart';
import '../controllers/project_controller.dart';
import '../states/project_state.dart';

class AddProjectForm extends ConsumerStatefulWidget {
  const AddProjectForm({
    super.key,
  });

  @override
  ConsumerState<AddProjectForm> createState() => _AddProjectFormState();
}

class _AddProjectFormState extends ConsumerState<AddProjectForm> {
  final formKey = GlobalKey<FormState>();
  final projectNameController = TextEditingController();

  void submit() {
    final projectController = ref.read(projectProvider.notifier);
    projectController.saveProject(projectNameController.text.trim());
  }

  String? mapValidationFailureToMessage(context, ValidationFailure? failure) {
    if (failure is EmptyFieldFailure) {
      return "Please enter a project name";
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
    projectNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(projectProvider, (prevState, state) {
      if (state is ProjectAdded) {
        navigateBack();
      }
    });

    final projectState = ref.watch(projectProvider);

    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: projectNameController,
            maxLines: 3,
            validator: (value) {
              final failure = ProjectValidator.validateTitle(value!);
              return mapValidationFailureToMessage(context, failure);
            },
            decoration: const InputDecoration(
              hintText: "Project Title",
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
            onTap: () {
              if (formKey.currentState!.validate()) submit();
            },
            title: "Save Project",
            isLoading: projectState is SavingProject,
          ),
        ],
      ),
    );
  }
}
