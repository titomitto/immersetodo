import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';

class ErrorHandler<T> {
  var validExceptions = [
    CacheException,
    ServerException,
    UnauthorizedException,
    UnexpectedResponseException,
    ServerValidationException,
    NotFoundException,
    NoInternetException,
    InvalidArgumentException,
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

      if (error is DioError &&
          validExceptions.contains(error.error.runtimeType)) {
        throw error.error!;
      }

      if (error is HiveError) {
        log("Hive error: $error", stackTrace: stackTrace);
        throw CacheException();
      }

      log('Uncought error: $error', stackTrace: stackTrace);
      throw InvalidArgumentException();
    }
  }

  Future<Either<Failure, T>> handleExceptions<T>(
      Future<T> Function() asyncFunction) async {
    try {
      return Right(await asyncFunction());
    } catch (error) {
      if (error is CacheException) {
        return Left(CacheFailure());
      } else if (error is ServerException) {
        return Left(ServerFailure());
      } else if (error is UnauthorizedException) {
        return Left(UnauthorizedFailure());
      } else if (error is UnexpectedResponseException) {
        return Left(UnexpectedResponseFailure());
      } else if (error is ServerValidationException) {
        return Left(ServerValidationFailure());
      } else if (error is NotFoundException) {
        return Left(NotFoundFailure());
      } else if (error is NoInternetException) {
        return Left(NoInternetFailure());
      } else {
        return Left(InvalidArgumentFailure());
      }
    }
  }
}
