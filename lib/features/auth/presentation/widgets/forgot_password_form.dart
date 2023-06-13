import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:immersetodo/features/auth/domain/validators/phone_number_validator.dart';
import 'package:immersetodo/utils/utils.dart';
import 'package:immersetodo/widgets/primary_button.dart';
import '../../../../config/styles.dart';
import '../../domain/validators/failures.dart';
import 'register_button.dart';
import '../controllers/auth_controller.dart';
import '../states/auth_state.dart';

class ForgotPasswordForm extends ConsumerStatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  ConsumerState<ForgotPasswordForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<ForgotPasswordForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  String? mapValidationFailureToMessage(
      BuildContext context, ValidationFailure? validationFailure) {
    if (validationFailure is RequiredEmailFailure) {
      return "Email is required";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      authStateProvider,
      (previous, state) {
        if (state is SendingInstructionsFailed) {
          state.failure.showSnackBar(context);
        }

        if (state is SendingInstructionsSuccessful) {
          context.showSuccessSnackBar(
            "Instructions sent to ${emailController.text.trim()}",
          );
          context.pop();
        }
      },
    );

    final authController = ref.watch(authStateProvider.notifier);
    final authState = ref.watch(authStateProvider);
    final emailValidator = ref.watch(emailValidatorProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                final validationFailure = emailValidator.validateEmail(value!);
                return mapValidationFailureToMessage(
                    context, validationFailure);
              },
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                hintText: "Email",
                suffixIconColor: Color(Colors.grey.value),
                border: defaultInputBorder,
                enabledBorder: defaultInputBorder,
                focusedBorder: defaultInputBorder,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            PrimaryButton(
              isLoading: authState is SendingInstructions,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  authController.sendEmailInstructions(
                    email: emailController.text.trim(),
                  );
                }
              },
              title: 'Send Instructions',
            ),
            const SizedBox(
              height: 30,
            ),
            AccountAvailabilityWidget(
              text: "Remembered your password?",
              actionText: "Login",
              onTap: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}
