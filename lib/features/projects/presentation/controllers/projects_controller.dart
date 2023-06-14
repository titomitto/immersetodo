import 'package:riverpod/riverpod.dart';
import '../../domain/usecases/get_projects.dart';
import '../states/projects_state.dart';

class ProjectsController extends StateNotifier<ProjectsState> {
  StateNotifierProviderRef ref;
  GetProjects getProjectsUseCase;
  ProjectsController(this.ref, this.getProjectsUseCase)
      : super(ProjectsInitial()) {
    getProjects();
  }

  Future<void> getProjects() async {
    state = ProjectsLoading(state.projects);

    var response = await getProjectsUseCase();

    response.fold((failure) {
      state = ProjectsError(failure);
    }, (projects) {
      if (projects.isEmpty) {
        state = ProjectsEmpty();
        return;
      }
      state = ProjectsData(projects);
    });
  }
}

final projectsProvider =
    StateNotifierProvider.autoDispose<ProjectsController, ProjectsState>((ref) {
  GetProjects getProjectUseCase = ref.watch(getProjectsUseCaseProvider);
  return ProjectsController(ref, getProjectUseCase);
});
