import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/projects_repository_impl.dart';
import '../entities/sound.dart';
import '../repositories/sound_repository.dart';

class GetSounds extends NoParamsUseCase<List<Sound>> {
  SoundsRepository repository;

  GetSounds({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Sound>>> call() {
    return repository.getSounds();
  }
}

final getSoundsUseCaseProvider = Provider.autoDispose<GetSounds>((ref) {
  final repository = ref.watch(soundsRepositoryProvider);
  return GetSounds(repository: repository);
});
