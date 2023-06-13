import 'package:flutter/material.dart';

class OrWith extends StatelessWidget {
  final String text;
  const OrWith({
    super.key,
    required this.text,
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
          "Or $text with",
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
