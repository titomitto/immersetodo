import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:immersetodo/utils/utils.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../domain/validators/failures.dart';
import '../../domain/validators/login_validator.dart';
import 'continue_button.dart';
import 'password_input.dart';
import 'register_button.dart';
import '../../../../config/images.dart';
import '../controllers/auth_controller.dart';
import '../states/auth_state.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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

    if (validationFailure is RequiredNameFailure) {
      return "Name is required";
    }

    if (validationFailure != null) {
      return "Invalid input";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      authStateProvider,
      (previous, state) {
        if (state is LoginError) {
          state.failure.showSnackBar(context);
        }

        if (state is Authenticated) {
          context.showSuccessSnackBar(
            "Welcome ${state.user.firstName}",
          );
          context.go(HomeScreen.routePath);
        }
      },
    );

    final authController = ref.watch(authStateProvider.notifier);
    final loginState = ref.watch(authStateProvider);
    final loginValidator = ref.watch(loginValidatorProvider);

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 130),
          Image.asset(
            Images.appIcon,
            height: 30,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Welcome Back!",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Login to your account",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black54),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Email",
            ),
            validator: (value) {
              final validationFailure = loginValidator.validatePassword(value!);
              return mapValidationFailureToMessage(context, validationFailure);
            },
          ),
          const SizedBox(height: 10),
          PasswordInput(
            hintText: "Password",
            controller: passwordController,
            validator: (value) {
              final validationFailure = loginValidator.validatePassword(value!);
              return mapValidationFailureToMessage(context, validationFailure);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ContinueButton(
            isLoading: loginState is LoggingIn,
            onContinue: () {
              if (formKey.currentState!.validate()) {
                authController.login(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: null, //() => context.push(ResetPasswordScreen.routePath),
            child: Text(
              "Forgot Password?",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          const RegisterButton(),
        ],
      ),
    );
  }
}
