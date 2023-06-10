import 'package:core/core.dart';

class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingLoading extends OnboardingState {}

class OnboardingError extends OnboardingState {
  final Failure failure;
  OnboardingError(this.failure);
}

class OnboardingCompleted extends OnboardingState {}

class OnboardingNotCompleted extends OnboardingState {}
