import 'package:firebase_authentication/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DontHaveAccountWidget extends StatelessWidget {
  final TabController controller;
  final void Function()? onPressed;
  final String label;
  final String message;
  const DontHaveAccountWidget({
    Key? key,
    required this.controller,
    required this.onPressed,
    required this.label,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          message,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        TextButton(
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: AppColors.black,
            ),
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
