abstract class Failure {}

class ServerFailure extends Failure {}

class NetworkFailure extends Failure {}

class CacheFailure extends Failure {}

class UnauthorizedFailure extends Failure {}

class UnexpectedResponseFailure extends Failure {}

class ServerValidationFailure extends Failure {}

class InvalidArgumentFailure extends Failure {}

class CacheDeleteFailure extends Failure {}

class InvalidArgFailure extends Failure {}

class NotFoundFailure extends Failure {}

class ValidationFailure implements Failure {}

class AppwriteFailure implements Failure {
  final String message;
  AppwriteFailure(this.message);
}
