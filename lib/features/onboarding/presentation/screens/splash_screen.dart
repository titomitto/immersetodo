import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:immersetodo/utils/extensions/failure.dart';

import '../../../../config/images.dart';
import '../../../auth/auth.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../controllers/onboarding_controller.dart';
import '../states/onboarding_state.dart';
import 'onboarding_screen.dart';

class SplashScreen extends ConsumerWidget {
  static String routePath = "/splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    /*  ref.listen<OnboardingState>(onboardingStateProvider, (prev, next) async {
      if (next is OnboardingCompleted) {
        await ref.read(authStateProvider.notifier).getUser();
        await Future.delayed(const Duration(seconds: 2));
        context.go(HomeScreen.routePath);
      }

      if (next is OnboardingNotCompleted) {
        context.go(OnboardingScreen.routePath);
      }

      if (next is OnboardingError) {
        next.failure.showSnackBar(context);
      }
    }); */
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        Expanded(
            child: Container(
          alignment: AlignmentDirectional.center,
          child: Image.asset(Images.appIcon, width: 200, height: 200),
        )),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Text(
                "Immerse ToDo",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                "v0.1.0",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade300,
                    ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
