import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isDisabled;
  final bool isLoading;
  const PrimaryButton({
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDisabled || isLoading ? Colors.grey.shade300 : Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.black,
                ),
              )
            : Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isDisabled || isLoading
                          ? Colors.black45
                          : Colors.white,
                      fontSize: 15,
                    ),
              ),
      ),
    );
  }
}
