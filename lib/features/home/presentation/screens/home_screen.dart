import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../../../auth/presentation/states/auth_state.dart';
import '../widgets/calender_view.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GreetingsView(),
              const CalenderView(),
              Expanded(
                  child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/images/smiling-folder.json',
                      width: 250,
                    ),
                    Text(
                      "No pending tasks",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "You have no pending tasks. Add a new task to get started.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          log("index: $index");
        },
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
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
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.barChart),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
