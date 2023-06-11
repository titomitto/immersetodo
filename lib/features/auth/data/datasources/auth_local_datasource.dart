import 'dart:convert';
import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../../utils/error.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource implements LocalDataSource {
  Future<UserModel> getUser();
  Future<void> save(UserModel authData);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Future<Box<UserModel>> getBox;
  AuthLocalDataSourceImpl({
    required this.getBox,
  });

  @override
  Future<void> save(UserModel authData) async {
    var box = await getBox;
    return ErrorHandler<void>().handleErrors(() async {
      await box.add(authData);
    });
  }

  @override
  Future<UserModel> getUser() async {
    var box = await getBox;
    return ErrorHandler<UserModel>().handleErrors(() async {
      if (box.values.isEmpty) {
        throw NotFoundException();
      }
      return box.values.first;
    });
  }

  @override
  Future<void> clear() async {
    var box = await getBox;
    await box.clear();
  }
}

final authBoxProvider = FutureProvider.autoDispose<Box<UserModel>>((ref) async {
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  var containsEncryptionKey =
      await secureStorage.containsKey(key: 'encryptionKey');

  if (!containsEncryptionKey) {
    var key = Hive.generateSecureKey();
    await secureStorage.write(
        key: 'encryptionKey', value: base64UrlEncode(key));
  }

  var encryptionKeyString = await secureStorage.read(key: 'encryptionKey');

  var encryptionKey = base64Url.decode(encryptionKeyString!);

  final box = await Hive.openBox<UserModel>("auth",
      encryptionCipher: HiveAesCipher(encryptionKey));

  ref.onDispose(() async {
    await box.close();
  });
  return box;
});

final authLocalDataSourceProvider =
    Provider.autoDispose<AuthLocalDataSource>((ref) {
  var authBox = ref.watch(authBoxProvider.future);
  return AuthLocalDataSourceImpl(
    getBox: authBox,
  );
});
