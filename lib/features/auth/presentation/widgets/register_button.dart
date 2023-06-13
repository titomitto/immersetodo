import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/register_screen.dart';

class AccountAvailabilityWidget extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback? onTap;
  const AccountAvailabilityWidget({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$text ",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          Text(
            actionText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
          )
        ],
      ),
    );
  }
}
