import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../repositories/auth_repository.dart';
import '../validators/register_validator.dart';

class Register extends UseCase<void, RegisterParams> {
  AuthRepository repository;
  RegisterValidator validator;
  Register({
    required this.repository,
    required this.validator,
  });
  @override
  Future<Either<Failure, void>> call(RegisterParams params) {
    final validationFailure = validator.validate(params);
    if (validationFailure != null) {
      return Future.value(Left(validationFailure));
    }
    return repository.register(
      params.fullName,
      params.email,
      params.password,
    );
  }
}

class RegisterParams {
  String fullName;
  String email;

  String password;

  RegisterParams({
    required this.fullName,
    required this.email,
    required this.password,
  });
}

final registerUseCaseProvider = Provider.autoDispose<Register>(
  (ref) => Register(
    repository: ref.watch(authRepositoryProvider),
    validator: ref.watch(registerValidatorProvider),
  ),
);
