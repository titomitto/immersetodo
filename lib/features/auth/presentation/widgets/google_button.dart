import 'package:flutter/material.dart';

import '../../../../config/images.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isDisabled;
  final bool isLoading;
  const GoogleButton({
    super.key,
    required this.onTap,
    required this.title,
    this.isDisabled = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        margin: const EdgeInsets.symmetric(horizontal: 1),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDisabled || isLoading ? Colors.grey.shade300 : Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            Images.googleIcon,
            height: 20,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 15,
                ),
          )
        ]),
      ),
    );
  }
}
