import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, ${authState.user.firstName}",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Welcome to Immerse ToDo",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black45,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
