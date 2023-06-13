import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:immersetodo/config/images.dart';

import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../../../auth/presentation/states/auth_state.dart';
import '../widgets/greetings_view.dart';
import '../widgets/home_drawer.dart';

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
      appBar: AppBar(
        //backgroundColor: Colors.deepOrange,
        title: Image.asset(
          Images.appIcon,
          height: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FeatherIcons.bell),
          ),
          IconButton(
            onPressed: () {
              ref.read(authStateProvider.notifier).logout();
            },
            icon: const Icon(FeatherIcons.shoppingCart),
          ),
        ],
      ),
      drawer: const HomeDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GreetingsView(),
            Expanded(
                child: Center(
              child: Text(
                "Welcome to Immerse ToDo",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
