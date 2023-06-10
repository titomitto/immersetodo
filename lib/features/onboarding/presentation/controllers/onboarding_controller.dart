import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';
import '../states/onboarding_state.dart';

class OnboardingController extends StateNotifier<OnboardingState> {
  GetOnboardingStatus getOnboardingStatusUseCase;
  CompleteOnboaring completeOnboardingUseCase;
  OnboardingController({
    required this.getOnboardingStatusUseCase,
    required this.completeOnboardingUseCase,
  }) : super(OnboardingInitial()) {
    getStatus();
  }

  Future<void> getStatus() async {
    state = OnboardingLoading();
    var response = await getOnboardingStatusUseCase();
    response.fold((l) {
      state = OnboardingError(l);
    }, (r) {
      state = r ? OnboardingCompleted() : OnboardingNotCompleted();
    });
  }

  void completeOnboarding() async {
    state = OnboardingLoading();
    var response = await completeOnboardingUseCase();
    response.fold((l) {
      state = OnboardingError(l);
    }, (r) {
      state = OnboardingCompleted();
    });
  }
}

final onboardingStateProvider =
    StateNotifierProvider.autoDispose<OnboardingController, OnboardingState>(
        (ref) {
  final getOnboardingStatusUseCase =
      ref.watch(getOnboardingStatusUseCaseProvider);
  final completeOnboaringUseCase = ref.watch(completeOnboaringUseCaseProvider);
  return OnboardingController(
    getOnboardingStatusUseCase: getOnboardingStatusUseCase,
    completeOnboardingUseCase: completeOnboaringUseCase,
  );
});
