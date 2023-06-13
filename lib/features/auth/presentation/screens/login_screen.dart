import 'package:flutter/material.dart';
import '../widgets/auth_header.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  static String routePath = "/login";
  const LoginScreen({super.key});

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
                  title: "Welcome Back!",
                  subtitle: "Enter your email and password to continue",
                ),
                SizedBox(
                  height: 30,
                ),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
