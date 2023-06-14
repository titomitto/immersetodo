import 'dart:developer';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:immersetodo/features/sounds/data/data.dart';

import '../../domain/entities/sound.dart';
import '../../domain/repositories/sound_repository.dart';

class SoundsRepositoryImpl extends SoundsRepository {
  final SoundsRemoteDataSource localDataSource;

  SoundsRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Sound>>> getSounds() async {
    try {
      var soundModels = await localDataSource.getSounds();
      var sounds = soundModels.map((e) => e.toEntity()).toList();
      return Right(sounds);
    } catch (e) {
      log("$e");
      return Left(CacheFailure());
    }
  }
}

final soundsRepositoryProvider = Provider.autoDispose<SoundsRepository>((ref) {
  final soundsLocalDataSource = ref.watch(soundsLocalDataSourceProvider);
  return SoundsRepositoryImpl(localDataSource: soundsLocalDataSource);
});
