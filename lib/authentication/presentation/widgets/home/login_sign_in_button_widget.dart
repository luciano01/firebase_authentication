import 'package:firebase_authentication/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoginSignInButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const LoginSignInButtonWidget({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(label),
        ),
        style: ElevatedButton.styleFrom(
          primary: AppColors.deepOrange300,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
