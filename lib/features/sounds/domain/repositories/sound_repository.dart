import 'package:core/core.dart';
import 'package:dartz/dartz.dart' hide Task;

import '../entities/sound.dart';

abstract class SoundsRepository {
  Future<Either<Failure, List<Sound>>> getSounds();
}
