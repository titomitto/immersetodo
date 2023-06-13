import 'package:flutter/material.dart';
import '../widgets/add_task_form.dart';

class AddTaskScreen extends StatelessWidget {
  static String get routePath => "/add-task";
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Add Task"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: const AddTaskForm(),
      ),
    );
  }
}
