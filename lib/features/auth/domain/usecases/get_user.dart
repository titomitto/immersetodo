import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class GetUser extends NoParamsUseCase<User> {
  AuthRepository repository;
  GetUser({
    required this.repository,
  });
  @override
  Future<Either<Failure, User>> call() async {
    return repository.getUser();
  }
}

final getAuthDataUseCaseProvider = Provider.autoDispose<GetUser>((ref) {
  return GetUser(
    repository: ref.watch(authRepositoryProvider),
  );
});
