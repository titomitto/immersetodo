import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, void>> completeOnboarding();
  Future<Either<Failure, bool>> getOnboardingStatus();
}
