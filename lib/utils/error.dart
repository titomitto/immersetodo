import 'dart:async';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ErrorHandler<T> {
  var validExceptions = [
    CacheException,
    NetworkException,
    InvalidArgumentException,
    AppwriteException,
  ];

  Future<T> handleErrors(
    Future<T> Function() asyncFunction,
  ) async {
    try {
      return await asyncFunction();
    } catch (error, stackTrace) {
      if (validExceptions.contains(error.runtimeType)) {
        rethrow;
      }

      if (error is HiveError) {
        log("Hive error: $error", stackTrace: stackTrace);
        throw CacheException();
      }

      log('Uncought error: $error', stackTrace: stackTrace);
      throw InvalidArgumentException();
    }
  }

  Future<Either<Failure, T>> handleExceptions(
      Future<T> Function() asyncFunction) async {
    try {
      return Right(await asyncFunction());
    } catch (error) {
      if (error is CacheException) {
        return Left(CacheFailure());
      } else if (error is NetworkException) {
        return Left(NetworkFailure());
      } else if (error is AppwriteException) {
        log("AppwriteError ${error.type}, ${error.message}");
        if (error.message?.contains("Failed host lookup") ?? false) {
          return Left(NetworkFailure());
        }
        return Left(AppwriteFailure(error.message ?? "Unknown error"));
      } else {
        return Left(InvalidArgumentFailure());
      }
    }
  }
}
