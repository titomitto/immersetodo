import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/auth.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static String get routePath => "/settings";
  @override
  Widget build(BuildContext context, ref) {
    ref.listen<AuthState>(authStateProvider, (previous, next) {
      if (next is Unauthenticated) {
        context.go(LoginScreen.routePath);
      }
    });
    final authController = ref.read(authStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Account'),
            onTap: () {
              // TODO: Add account settings functionality
            },
          ),
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('Theme'),
            onTap: () {
              // TODO: Add theme settings functionality
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              authController.logout();
            },
          ),
          // Add any other relevant sections here
        ],
      ),
    );
  }
}
