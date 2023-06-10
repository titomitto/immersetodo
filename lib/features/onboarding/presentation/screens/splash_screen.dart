import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:immersetodo/utils/extensions/failure.dart';

import '../controllers/onboarding_controller.dart';
import '../states/onboarding_state.dart';
import 'onboarding_screen.dart';

class SplashScreen extends ConsumerWidget {
  static String routePath = "/splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.listen<OnboardingState>(onboardingStateProvider, (prev, next) async {
      if (next is OnboardingNotCompleted) {
        context.go(OnboardingScreen.routePath);
      }

      if (next is OnboardingError) {
        next.failure.showSnackBar(context);
      }
    });
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: AlignmentDirectional.center,
        child: const Text("Splash"),
      ),
    );
  }
}
