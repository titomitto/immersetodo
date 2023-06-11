import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:immersetodo/utils/utils.dart';

import '../../../../config/images.dart';
import '../../../../config/styles.dart';
import '../../domain/validators/failures.dart';
import '../../domain/validators/register_validator.dart';
import '../controllers/auth_controller.dart';
import '../states/auth_state.dart';
import 'continue_button.dart';
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
      },
    );
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Image.asset(
            Images.appIcon,
            height: 30,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Create an account",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Sign up to get started!",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black54),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: fullNameController,
            validator: (value) {
              final validationFailure =
                  registerValidator.validateFullName(value!);
              return mapValidationFailureToMessage(context, validationFailure);
            },
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              hintText: "Full name",
              border: defaultInputBorder,
              enabledBorder: defaultInputBorder,
              focusedBorder: defaultInputBorder,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: emailController,
            validator: (value) {
              final validationFailure = registerValidator.validateEmail(value!);
              return mapValidationFailureToMessage(context, validationFailure);
            },
          ),
          const SizedBox(height: 10),
          PasswordInput(
            controller: passwordController,
            hintText: "Password",
            validator: (value) {
              final validationFailure =
                  registerValidator.validatePassword(value!);
              return mapValidationFailureToMessage(context, validationFailure);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("By creating an account, you agree to our"),
          ContinueButton(
            isLoading: authState is Registering,
            onContinue: () {
              authController.register(
                fullName: fullNameController.text,
                email: emailController.text,
                password: passwordController.text,
              );
            },
            //onContinue: submit,
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => context.pop(),
            behavior: HitTestBehavior.opaque,
            child: Text(
              "Already have an account? Sign in",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
