import 'package:flutter/material.dart';

import '../widgets/tasks_list_view.dart';

class AddProjectScreen extends StatelessWidget {
  static String get routePath => "/add-task";
  const AddProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Projects"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: const ProjectsListView(),
      ),
    );
  }
}
