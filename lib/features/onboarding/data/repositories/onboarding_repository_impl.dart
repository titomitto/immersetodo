import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/error.dart';
import '../../domain/domain.dart';
import '../datasources/onboarding_local_datasource.dart';

class OnboardingRepositoryImpl extends OnboardingRepository {
  OnboardingLocalDatasource localDataSource;
  OnboardingRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, bool>> getOnboardingStatus() async {
    return ErrorHandler<bool>().handleExceptions(() async {
      return await localDataSource.getOnboardingStatus();
    });
  }

  @override
  Future<Either<Failure, void>> completeOnboarding() async {
    return ErrorHandler<bool>().handleExceptions(() async {
      return await localDataSource.completeOnboarding();
    });
  }
}

final onboardingRepositoryProvider =
    Provider.autoDispose<OnboardingRepository>((ref) {
  final localDataSource = ref.watch(onboardingLocalDatasourceProvider);
  return OnboardingRepositoryImpl(localDataSource: localDataSource);
});
