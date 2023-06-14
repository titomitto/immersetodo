import 'package:flutter/material.dart';
import '../../domain/entities/task.dart';

class TaskScreen extends StatelessWidget {
  static String get routePath => "/task";
  final Task task;
  const TaskScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(task.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Text(
            task.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black54,
                ),
          ),
        ]),
      ),
    );
  }
}
