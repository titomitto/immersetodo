import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:immersetodo/features/auth/presentation/widgets/register_button.dart';
import 'package:immersetodo/utils/utils.dart';

import '../../../../config/styles.dart';
import '../../../../widgets/primary_button.dart';
import '../../domain/validators/failures.dart';
import '../../domain/validators/register_validator.dart';
import '../controllers/auth_controller.dart';
import '../states/auth_state.dart';
import 'google_button.dart';
import 'or_with.dart';
import 'password_input.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? mapValidationFailureToMessage(
      BuildContext context, ValidationFailure? validationFailure) {
    if (validationFailure is RequiredPasswordFailure) {
      return "Password is required";
    }

    if (validationFailure is PasswordLengthFailure) {
      return "Password is too short";
    }

    if (validationFailure is RequiredEmailFailure) {
      return "Email is required";
    }

    if (validationFailure != null) {
      return "Invalid input";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    var authController = ref.watch(authStateProvider.notifier);
    var authState = ref.watch(authStateProvider);
    var registerValidator = ref.read(registerValidatorProvider);

    ref.listen(
      authStateProvider,
      (previous, state) {
        if (state is RegistrationError) {
          state.failure.showSnackBar(context);
        }

        if (state is RegistrationSuccessful) {
          context.showSuccessSnackBar("Registration successful");
          context.pop();
        }
      },
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: fullNameController,
              keyboardType: TextInputType.text,
              validator: (value) {
                final validationFailure =
                    registerValidator.validateFullName(value!);
                return mapValidationFailureToMessage(
                    context, validationFailure);
              },
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                hintText: "Full Name",
                suffixIconColor: Color(Colors.grey.value),
                border: defaultInputBorder,
                enabledBorder: defaultInputBorder,
                focusedBorder: defaultInputBorder,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                final validationFailure =
                    registerValidator.validatePassword(value!);
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
            const SizedBox(height: 10),
            PasswordInput(
              hintText: "Password",
              controller: passwordController,
              validator: (value) {
                final validationFailure =
                    registerValidator.validatePassword(value!);
                return mapValidationFailureToMessage(
                    context, validationFailure);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            PrimaryButton(
              isLoading: authState is Registering,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  authController.register(
                    fullName: fullNameController.text.trim(),
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                }
              },
              title: 'Sign up',
            ),
            const SizedBox(
              height: 20,
            ),
            const OrWith(
              text: "register",
            ),
            const SizedBox(
              height: 20,
            ),
            GoogleButton(
              onTap: () {},
              title: 'Sign up with Google',
            ),
            const SizedBox(
              height: 20,
            ),
            AccountAvailabilityWidget(
              text: "Already have an account?",
              actionText: "Login",
              onTap: () => context.pop(),
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
