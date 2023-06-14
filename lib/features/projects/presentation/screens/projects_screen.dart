import 'package:flutter/material.dart';

import '../widgets/projects_list_view.dart';

class ProjectsScreen extends StatelessWidget {
  static String get routePath => "/projects";
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Projects",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Expanded(child: ProjectsListView()),
          ],
        ),
      ),
    );
  }
}
