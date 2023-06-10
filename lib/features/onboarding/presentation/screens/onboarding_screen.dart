import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:immersetodo/utils/utils.dart';
import '../controllers/onboarding_controller.dart';
import '../states/onboarding_state.dart';

class OnboardingScreen extends ConsumerWidget {
  static String routePath = "/intro";
  const OnboardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35.0,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        buildIntroTitle(context),
                        const SizedBox(height: 10),
                        buildIntroBody(context),
                        const SizedBox(height: 20),
                        const ContinueButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text buildIntroBody(BuildContext context) {
    return Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Text buildIntroTitle(BuildContext context) {
    return Text(
      "Welcome to ImmerseToDo",
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
    );
  }
}

class ContinueButton extends ConsumerWidget {
  const ContinueButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(onboardingStateProvider, (previous, next) {
      if (next is OnboardingError) {
        next.failure.showSnackBar(context);
      }
    });

    var onboardingController = ref.watch(onboardingStateProvider.notifier);
    var onBoardingState = ref.watch(onboardingStateProvider);

    if (onBoardingState is OnboardingLoading) {
      return const SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(),
      );
    }

    return MaterialButton(
      onPressed: () {
        onboardingController.completeOnboarding();
      },
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Continue",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
          )
        ],
      ),
    );
  }
}
