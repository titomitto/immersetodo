import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/register_screen.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(RegisterScreen.routePath),
      behavior: HitTestBehavior.opaque,
      child: Text(
        "Register",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }
}
