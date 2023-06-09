import '../errors/failures.dart';

abstract class Validator<T> {
  ValidationFailure? validate(T params);
}
