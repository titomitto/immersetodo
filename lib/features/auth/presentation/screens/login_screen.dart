import 'package:flutter/material.dart';
import '../../../../config/images.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  static String routePath = "/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 80),
                      Image.asset(
                        Images.dropIconBlack,
                        height: 50,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Welcome Back!",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Login to your account",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                    ]),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
