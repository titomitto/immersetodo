import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/failure.dart';
import '../controllers/project_controller.dart';
import '../controllers/projects_controller.dart';
import '../states/project_state.dart';
import '../states/projects_state.dart';
import 'empty_view.dart';
import 'error_view.dart';
import 'project_view.dart';

class ProjectsListView extends ConsumerStatefulWidget {
  const ProjectsListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProjectsListViewState();
}

class _ProjectsListViewState extends ConsumerState<ProjectsListView> {
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(projectsProvider);

    ref.listen(projectProvider, (previous, next) {
      if (next is ProjectAdded ||
          next is ProjectDeleted ||
          next is ProjectUpdated) {
        ref.read(projectsProvider.notifier).getProjects();
      }
    });

    if (state is ProjectsLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is ProjectsError) {
      return ErrorView(message: mapFailureToMessage(context, state.failure));
    }

    if (state is ProjectsEmpty) {
      return const EmptyView();
    }

    if (state is ProjectsData) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: state.projects.length,
          itemBuilder: (context, index) {
            var project = state.projects[index];
            return ProjectView(project: project);
          },
        ),
      );
    }

    return Container();
  }
}
