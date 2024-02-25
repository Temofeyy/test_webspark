import 'package:flutter/material.dart';

class AsyncButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isLoading;
  const AsyncButton({
    super.key,
    required this.label,
    this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: FilledButton(
        onPressed: isLoading ? null: onTap,
        child: Stack(
          children: [
            Center(child: Text(label)),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
