import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/images.dart';
import '../../../auth/presentation/presentation.dart';

class GreetingsView extends ConsumerWidget {
  const GreetingsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final authState = ref.watch(authStateProvider);
    if (authState is! Authenticated) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            child: Image.asset(
              Images.userPlaceholder,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome!",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black45,
                      ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  authState.user.fullName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.bell,
            ),
          ),
        ],
      ),
    );
  }
}
