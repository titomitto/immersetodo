import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:immersetodo/features/pomodoro/presentation/screens/pomodoro_screen.dart';
import '../../domain/entities/task.dart';
import '../controllers/tasks_controller.dart';

class TaskView extends ConsumerWidget {
  final Task task;
  const TaskView({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final tasksController = ref.watch(tasksProvider.notifier);
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        tasksController.removeTask(task);
      },
      background: Container(
        color: Colors.white,
        child: const Icon(
          Iconsax.trash,
          color: Colors.red,
          size: 20,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3,
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CheckBox(task: task),
                  Expanded(
                    child: Text(
                      task.title,
                      style: TextStyle(
                        decoration: task.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 18,
                        color: task.isDone ? Colors.grey : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PomodoroButton(task: task)
          ],
        ),
      ),
    );
  }
}

class CheckBox extends ConsumerWidget {
  const CheckBox({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          ref.read(tasksProvider.notifier).toggle(task);
        },
        behavior: HitTestBehavior.opaque,
        child: Icon(
          task.isDone ? EvaIcons.checkmarkSquare2 : EvaIcons.squareOutline,
          color: task.isDone ? Colors.black : Colors.grey,
          size: 28,
        ),
      ),
    );
  }
}

class PomodoroButton extends ConsumerWidget {
  const PomodoroButton({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        context.push(PomodoroScreen.routePath);
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Icon(
          Iconsax.timer_1,
          color: Colors.grey,
          size: 20,
        ),
      ),
    );
  }
}
