import 'package:flutter/material.dart';
import 'package:immersetodo/features/auth/presentation/widgets/forgot_password_form.dart';
import '../widgets/auth_header.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routePath = "/forgot-password";
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AuthHeader(
                  title: "Forgot Password",
                  subtitle: "Enter your email to continue",
                ),
                SizedBox(
                  height: 30,
                ),
                ForgotPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
