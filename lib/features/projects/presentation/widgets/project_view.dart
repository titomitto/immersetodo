import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/project.dart';
import '../controllers/project_controller.dart';

class ProjectView extends StatelessWidget {
  final Project project;
  const ProjectView({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Expanded(
                  child: Text(
                    project.name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
          DeleteButton(project: project)
        ],
      ),
    );
  }
}

class DeleteButton extends ConsumerWidget {
  const DeleteButton({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        ref.read(projectProvider.notifier).removeProject(project);
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Icon(
          Iconsax.trash,
          color: Colors.grey,
          size: 20,
        ),
      ),
    );
  }
}
