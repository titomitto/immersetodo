import 'package:core/core.dart';

import '../../domain/entities/user.dart';

class AuthState {}

class LoginInitial extends AuthState {}

class LoggingIn extends AuthState {}

class Registering extends AuthState {}

class VerifyingPassword extends AuthState {}

class RegistrationSuccessful extends AuthState {}

class Authenticated extends AuthState {
  final User user;
  Authenticated(this.user);
}

class Unauthenticated extends AuthState {}

class LoginError extends AuthState {
  final Failure failure;
  LoginError(this.failure);
}

class RegistrationError extends AuthState {
  final Failure failure;
  RegistrationError(this.failure);
}
