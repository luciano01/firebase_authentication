import 'package:firebase_authentication/core/utils/app_colors.dart';
import 'package:firebase_authentication/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class OrLoginWithWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String message;
  final String label;
  const OrLoginWithWidget({
    Key? key,
    required this.onPressed,
    required this.message,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Divider(
                  color: AppColors.grey600,
                ),
              ),
            ),
            Text(
              message,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Divider(
                  color: AppColors.grey600,
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          width: MediaQuery.of(context).size.width,
          child: TextButton(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.google,
                    width: 25,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    label,
                    style: const TextStyle(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
