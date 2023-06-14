import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../../../auth/presentation/states/auth_state.dart';
import '../../../tasks/presentation/widgets/add_task_form.dart';
import '../../../tasks/presentation/widgets/tasks_list_view.dart';
import '../widgets/greetings_view.dart';

final homeScreenIndexProvider = Provider<int>((ref) => 0);

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
        child: {
          0: homeView(),
          1: const TasksListView(),
          3: const AddTaskForm(),
          4: const GreetingsView(),
        }[ref.watch(homeScreenIndexProvider)]!,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index != 2) {
            //ref.read(homeScreenIndexProvider) = index;
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
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  builder: (context) => Container(
                      padding: const EdgeInsets.all(20).copyWith(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(children: [
                            const Text(
                              "Add Task",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Close button
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(FeatherIcons.x),
                            ),
                          ]),
                          const AddTaskForm(),
                        ],
                      )),
                );
              },
              child: Icon(FeatherIcons.plus),
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

  Container homeView() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GreetingsView(),
          //CalenderView(),
          Expanded(child: TasksListView()),
        ],
      ),
    );
  }
}
