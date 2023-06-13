import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';
import '../states/project_state.dart';

class ProjectController extends StateNotifier<ProjectState> {
  AddProject addProject;
  DeleteProject deleteProject;
  UpdateProject updateProject;
  ProjectController({
    required this.addProject,
    required this.deleteProject,
    required this.updateProject,
  }) : super(ProjectInitial());

  void saveProject(String title) async {
    state = ProjectSaving();
    var response = await addProject(AddProjectParams(title: title));
    await response.fold((failure) {
      state = ProjectFailed(failure);
    }, (success) async {
      state = ProjectAdded();
    });
  }

  void removeProject(Project project) async {
    var response = await deleteProject(DeleteProjectParams(project: project));

    await response.fold((failure) {
      state = ProjectFailed(failure);
    }, (_) async {
      state = ProjectDeleted();
    });
  }
}

final projectProvider =
    StateNotifierProvider.autoDispose<ProjectController, ProjectState>((ref) {
  AddProject addProject = ref.watch(addProjectUseCaseProvider);
  DeleteProject deleteProject = ref.watch(deleteProjectUseCaseProvider);
  UpdateProject updateProject = ref.watch(updateProjectUseCaseProvider);
  return ProjectController(
    addProject: addProject,
    deleteProject: deleteProject,
    updateProject: updateProject,
  );
});
