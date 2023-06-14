import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:immersetodo/config/constants.dart';
import '../../../../config/client.dart';
import '../models/sound_model.dart';

abstract class SoundsRemoteDataSource implements LocalDataSource {
  Future<List<SoundsModel>> getSounds();
}

class SoundsLocalDataSourceImpl extends SoundsRemoteDataSource {
  final String soundsCollectionId = "648a235f883343660f0b";
  final Databases databases;

  SoundsLocalDataSourceImpl(this.databases);

  @override
  Future<List<SoundsModel>> getSounds() async {
    try {
      var sounds = await databases.listDocuments(
        collectionId: soundsCollectionId,
        databaseId: databaseId,
      );

      log("projects: ${sounds.documents}");

      return sounds.documents.map((e) {
        log("e.data: ${e.data}");
        return SoundsModel.fromMap(e.data);
      }).toList();
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<void> clear() async {}
}

final soundsLocalDataSourceProvider =
    Provider.autoDispose<SoundsRemoteDataSource>((ref) {
  return SoundsLocalDataSourceImpl(ref.watch(databasesProvider));
});
