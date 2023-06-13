import 'package:flutter/material.dart';
import '../widgets/auth_header.dart';
import '../widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  static String routePath = "/register";
  const RegisterScreen({super.key});

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
                  title: "Create Account",
                  subtitle: "Enter your details to continue",
                ),
                SizedBox(
                  height: 20,
                ),
                RegisterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
