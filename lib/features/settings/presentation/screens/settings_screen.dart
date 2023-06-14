import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/auth.dart';
import '../widgets/user_account_view.dart';

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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            const UserAccountView(),
            Divider(
              color: Colors.grey.shade200,
            ),
            ListTile(
              leading: const Icon(FeatherIcons.moon),
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Dark Mode',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black54,
                    ),
              ),
              onTap: () {
                // TODO: Add theme settings functionality
              },
              trailing: SizedBox(
                width: 50,
                child: FlutterSwitch(
                  value: false,
                  width: 45.0,
                  height: 22.0,
                  toggleSize: 19,
                  activeColor: Theme.of(context).primaryColor,
                  onToggle: (bool value) {},
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                FeatherIcons.logOut,
                color: Colors.redAccent,
              ),
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Logout',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.redAccent,
                    ),
              ),
              onTap: () {
                authController.logout();
              },
            ),
            // Add any other relevant sections here
          ],
        ),
      ),
    );
  }
}
