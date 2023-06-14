import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:immersetodo/config/constants.dart';
import '../../../../config/client.dart';
import '../models/task_model.dart';

abstract class TasksRemoteDataSource implements LocalDataSource {
  Future<List<TaskModel>> getTasks();
  Future<void> addTask(String title, String description);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(TaskModel task);
}

class TasksLocalDataSourceImpl extends TasksRemoteDataSource {
  final String tasksCollectionId = "6488ddacbcc43af01253";
  final Databases databases;

  TasksLocalDataSourceImpl(this.databases);

  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      var tasks = await databases.listDocuments(
        collectionId: tasksCollectionId,
        databaseId: databaseId,
      );

      log("tasks: ${tasks.documents}");

      return tasks.documents.map((e) {
        log("e.data: ${e.data}");
        return TaskModel.fromMap(e.data);
      }).toList();
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<bool> addTask(String title, String description) async {
    try {
      final task = TaskModel(
        title: title,
        isDone: false,
        description: description,
      );
      await databases.createDocument(
        databaseId: databaseId,
        collectionId: tasksCollectionId,
        documentId: ID.unique(),
        data: task.toMap(),
      );

      return true;
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<void> deleteTask(TaskModel task) async {
    try {
      await databases.deleteDocument(
        databaseId: databaseId,
        collectionId: tasksCollectionId,
        documentId: task.id!,
      );
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<bool> updateTask(TaskModel task) async {
    try {
      await databases.updateDocument(
        databaseId: databaseId,
        collectionId: tasksCollectionId,
        documentId: task.id!,
        data: task.toMap(),
      );
      return true;
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<void> clear() async {
    try {
      //await databases.
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }
}

final tasksBoxProvider =
    FutureProvider.autoDispose<Box<TaskModel>>((ref) async {
  Box<TaskModel> box = await Hive.openBox("tasks");
  ref.onDispose(() {
    box.close();
    log("tasksBoxProvider disposed");
  });
  return box;
});

final tasksLocalDataSourceProvider =
    Provider.autoDispose<TasksRemoteDataSource>((ref) {
  return TasksLocalDataSourceImpl(ref.watch(databasesProvider));
});
