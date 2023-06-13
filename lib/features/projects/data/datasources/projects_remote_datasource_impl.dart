import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:immersetodo/config/constants.dart';
import '../../../../config/client.dart';
import '../models/project_model.dart';

abstract class ProjectsRemoteDataSource implements LocalDataSource {
  Future<List<ProjectModel>> getProjects();
  Future<void> addProject(String name);
  Future<void> updateProject(ProjectModel project);
  Future<void> deleteProject(ProjectModel project);
}

class ProjectsLocalDataSourceImpl extends ProjectsRemoteDataSource {
  final String projectsCollectionId = "6488e952dc714a10c252";
  final Databases databases;

  ProjectsLocalDataSourceImpl(this.databases);

  @override
  Future<List<ProjectModel>> getProjects() async {
    try {
      var projects = await databases.listDocuments(
        collectionId: projectsCollectionId,
        databaseId: databaseId,
      );

      log("projects: ${projects.documents}");

      return projects.documents.map((e) {
        log("e.data: ${e.data}");
        return ProjectModel.fromMap(e.data);
      }).toList();
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<bool> addProject(String name) async {
    try {
      final project = ProjectModel(
        name: name,
      );
      await databases.createDocument(
        databaseId: databaseId,
        collectionId: projectsCollectionId,
        documentId: ID.unique(),
        data: project.toMap(),
      );

      return true;
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<void> deleteProject(ProjectModel project) async {
    try {
      await databases.deleteDocument(
        databaseId: databaseId,
        collectionId: projectsCollectionId,
        documentId: project.id!,
      );
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<bool> updateProject(ProjectModel project) async {
    try {
      await databases.updateDocument(
        databaseId: databaseId,
        collectionId: projectsCollectionId,
        documentId: project.id!,
        data: project.toMap(),
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

final projectsLocalDataSourceProvider =
    Provider.autoDispose<ProjectsRemoteDataSource>((ref) {
  return ProjectsLocalDataSourceImpl(ref.watch(databasesProvider));
});
