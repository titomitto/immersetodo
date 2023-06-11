import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../repositories/auth_repository.dart';

class Logout extends NoParamsUseCase<void> {
  AuthRepository repository;
  Logout({
    required this.repository,
  });
  @override
  Future<Either<Failure, void>> call() async {
    return repository.logout();
  }
}

final logOutUseCaseProvider = Provider.autoDispose<Logout>((ref) {
  return Logout(
    repository: ref.watch(authRepositoryProvider),
  );
});
