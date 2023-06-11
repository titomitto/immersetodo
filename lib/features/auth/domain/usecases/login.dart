import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';
import '../validators/login_validator.dart';

class Login extends UseCase<User, LoginParams> {
  AuthRepository repository;
  LoginValidator validator;
  Login({
    required this.repository,
    required this.validator,
  });
  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    var validationFailure = validator.validate(params);

    if (validationFailure != null) return Left(validationFailure);

    return repository.login(
      params.email,
      params.password,
    );
  }
}

class LoginParams {
  String email;
  String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}

final loginUseCaseProvider = Provider.autoDispose<Login>((ref) {
  return Login(
    repository: ref.watch(authRepositoryProvider),
    validator: ref.watch(loginValidatorProvider),
  );
});
