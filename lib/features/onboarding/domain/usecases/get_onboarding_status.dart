import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/onboarding_repository_impl.dart';
import '../repositories/onboarding_repository.dart';

class GetOnboardingStatus extends NoParamsUseCase<bool> {
  final OnboardingRepository repository;

  GetOnboardingStatus(this.repository);

  @override
  Future<Either<Failure, bool>> call() async {
    return await repository.getOnboardingStatus();
  }
}

final getOnboardingStatusUseCaseProvider =
    Provider.autoDispose<GetOnboardingStatus>((ref) {
  final repository = ref.watch(onboardingRepositoryProvider);
  return GetOnboardingStatus(repository);
});
