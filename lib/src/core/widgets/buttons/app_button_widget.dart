import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.isValid = true,
    super.key,
  });

  final String title;
  final void Function() onPressed;
  final bool isLoading;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isValid
          ? () {
              if (isLoading) return;
              if (isValid) {
                onPressed();
              }
            }
          : null,
      child: isLoading ? const _LoadingWidget() : Text(title),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: const CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 3,
      ),
    );
  }
}
