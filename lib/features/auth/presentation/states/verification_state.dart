import 'package:core/core.dart';

abstract class VerificationState {}

class VerificationInitial extends VerificationState {}

class Verifying extends VerificationState {}

class VerificationSuccess extends VerificationState {}

class VerificationError extends VerificationState {
  final Failure failure;
  VerificationError(this.failure);
}
