import 'package:firebase_authentication/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Firebase',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 36,
          ),
        ),
        Text(
          'Authentication',
          style: TextStyle(
            color: AppColors.deepOrange300,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
