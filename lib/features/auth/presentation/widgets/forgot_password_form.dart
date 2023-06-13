import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:immersetodo/utils/utils.dart';
import 'package:immersetodo/widgets/primary_button.dart';
import '../../../../config/styles.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../domain/validators/failures.dart';
import '../../domain/validators/login_validator.dart';
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
                final validationFailure =
                    loginValidator.validatePassword(value!);
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
              isLoading: loginState is LoggingIn,
              onTap: () {
                /* if (formKey.currentState!.validate()) {
                  authController.login(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                } */
              },
              title: 'Continue',
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
