import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final String? title;
  final bool isLoading;
  final bool isDisabled;
  final void Function()? onContinue;
  const ContinueButton({
    Key? key,
    this.isLoading = false,
    required this.onContinue,
    this.isDisabled = false,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading || isDisabled ? null : onContinue,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: isLoading || isDisabled
              ? Colors.grey.shade300
              : Theme.of(context).primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  )
                : Text(
                    title ?? "Continue",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                  ),
          ],
        ),
      ),
    );
  }
}
