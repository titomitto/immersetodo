import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> getUser();

  Future<Either<Failure, User>> login(
    String email,
    String password,
  );

  Future<Either<Failure, void>> resendVerification();

  Future<Either<Failure, void>> register(
    String name,
    String email,
    String password,
  );

  Future<Either<Failure, void>> logout();
}
