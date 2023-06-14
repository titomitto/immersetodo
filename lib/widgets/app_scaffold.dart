import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:immersetodo/features/home/presentation/screens/home_screen.dart';
import 'package:immersetodo/features/projects/presentation/screens/projects_screen.dart';
import 'package:immersetodo/features/projects/presentation/widgets/add_project_form.dart';

import '../utils/utils.dart';
import '../features/auth/auth.dart';
import '../features/settings/presentation/screens/settings_screen.dart';
import '../features/stats/presentation/screens/stats_screen.dart';
import '../features/tasks/presentation/widgets/add_task_form.dart';

class AppScaffold extends ConsumerWidget {
  final Widget child;
  const AppScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, ref) {
    var currentRoute = GoRouter.of(context).location;
    var isProject = currentRoute == ProjectsScreen.routePath;
    var authState = ref.watch(authStateProvider);
    var routeIndex = [
      HomeScreen.routePath,
      ProjectsScreen.routePath,
      "",
      StatsScreen.routePath,
      SettingsScreen.routePath,
    ].indexOf(currentRoute);

    if (authState is Unauthenticated) {
      return const SizedBox();
    }

    return Scaffold(
      body: SafeArea(
        child: child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: routeIndex != -1 ? routeIndex : 0,
        onTap: (index) {
          if (index == 0) {
            context.go(HomeScreen.routePath);
          }
          if (index == 1) {
            context.go(ProjectsScreen.routePath);
          }
          if (index == 3) {
            context.go(StatsScreen.routePath);
          }
          if (index == 4) {
            context.go(SettingsScreen.routePath);
          }
        },
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(FeatherIcons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(FeatherIcons.grid),
            label: "Projects",
          ),
          BottomNavigationBarItem(
            icon: FloatingActionButton(
              mini: true,
              onPressed: () {
                showModal(
                  context,
                  title: isProject ? "Add Project" : "Add Task",
                  child:
                      isProject ? const AddProjectForm() : const AddTaskForm(),
                );
              },
              child: const Icon(FeatherIcons.plus),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(FeatherIcons.barChart),
            label: "Calendar",
          ),
          const BottomNavigationBarItem(
            icon: Icon(FeatherIcons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
