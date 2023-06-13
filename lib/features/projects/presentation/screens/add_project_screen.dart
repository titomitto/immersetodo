import 'package:flutter/material.dart';
import '../widgets/add_project_form.dart';

class AddProjectScreen extends StatelessWidget {
  static String get routePath => "/add-task";
  const AddProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Add Project"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: const AddProjectForm(),
      ),
    );
  }
}
