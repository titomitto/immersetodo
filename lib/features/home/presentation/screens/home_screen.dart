import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../../../auth/presentation/states/auth_state.dart';
import '../../../tasks/presentation/screens/add_task_screen.dart';
import '../../../tasks/presentation/widgets/tasks_list_view.dart';
import '../widgets/greetings_view.dart';

class HomeScreen extends ConsumerWidget {
  static String routePath = "/";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(authStateProvider, (previous, next) async {
      if (next is Unauthenticated) {
        context.go(LoginScreen.routePath);
        await ref.read(authStateProvider.notifier).logout();
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreetingsView(),
              //CalenderView(),
              Expanded(child: TasksListView()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          log("index: $index");
          if (index == 2) {
            context.push(AddTaskScreen.routePath);
            return;
            /* showBottomSheet(
                context: context, builder: (context) => const AddTaskForm(),); */
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
            icon: AbsorbPointer(
              child: FloatingActionButton(
                mini: true,
                onPressed: () {},
                child: Icon(FeatherIcons.plus),
              ),
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
