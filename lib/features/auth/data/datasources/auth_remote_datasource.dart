import 'package:appwrite/appwrite.dart';
import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:immersetodo/config/client.dart';
import 'package:immersetodo/utils/utils.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> loginWithEmail(
    String email,
    String password,
  );

  Future<void> registerAccount(
    String fullName,
    String email,
    String password,
  );

  Future<void> sendVerification();

  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  Account account;
  NetworkInfo networkInfo;
  AuthRemoteDataSourceImpl({required this.account, required this.networkInfo});

  @override
  Future<UserModel> loginWithEmail(
    String email,
    String password,
  ) async {
    return ErrorHandler<UserModel>().handleErrors(() async {
      await account.createEmailSession(
        email: email,
        password: password,
      );

      var user = await account.get();

      UserModel authData = UserModel(
        id: user.$id,
        email: user.email,
        fullName: user.name,
        isVerified: user.emailVerification,
      );

      return authData;
    });
  }

  @override
  Future<void> registerAccount(
    String fullName,
    String email,
    String password,
  ) async {
    return ErrorHandler<void>().handleErrors(() async {
      await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: fullName,
      );
    });
  }

  @override
  Future<void> sendVerification() {
    return ErrorHandler<void>().handleErrors(() async {
      await account.createVerification(
        url: 'https://immersetodo.com',
      );
    });
  }

  @override
  Future<void> logout() {
    return ErrorHandler<void>().handleErrors(() async {
      await account.deleteSession(sessionId: 'current');
    });
  }
}

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  var account = ref.watch(accountProvider);
  return AuthRemoteDataSourceImpl(
    account: account,
    networkInfo: ref.watch(networkInfoProvider),
  );
});
