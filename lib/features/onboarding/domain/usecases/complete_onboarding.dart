import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/onboarding_repository_impl.dart';
import '../repositories/onboarding_repository.dart';

class CompleteOnboaring extends NoParamsUseCase<void> {
  final OnboardingRepository repository;

  CompleteOnboaring(this.repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await repository.completeOnboarding();
  }
}

final completeOnboaringUseCaseProvider =
    Provider.autoDispose<CompleteOnboaring>((ref) {
  final repository = ref.watch(onboardingRepositoryProvider);
  return CompleteOnboaring(repository);
});
