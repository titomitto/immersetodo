import 'package:core/core.dart';

import '../../domain/entities/user.dart';

class AuthState {}

class LoginInitial extends AuthState {}

class LoggingIn extends AuthState {}

class Registering extends AuthState {}

class RegistrationSuccessful extends AuthState {}

class Authenticated extends AuthState {
  final User user;
  Authenticated(this.user);
}

class Unauthenticated extends AuthState {}

class LoginFailed extends AuthState {
  final Failure failure;
  LoginFailed(this.failure);
}

class RegistrationFailed extends AuthState {
  final Failure failure;
  RegistrationFailed(this.failure);
}

class SendingInstructions extends AuthState {}

class SendingInstructionsSuccessful extends AuthState {}

class SendingInstructionsFailed extends AuthState {
  final Failure failure;
  SendingInstructionsFailed(this.failure);
}
