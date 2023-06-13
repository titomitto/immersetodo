import 'package:flutter/material.dart';

class OrLoginWith extends StatelessWidget {
  const OrLoginWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(children: [
        Expanded(
          child: Divider(
            color: Colors.grey.shade400,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          "Or login with",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Divider(
            color: Colors.grey.shade400,
          ),
        ),
      ]),
    );
  }
}
