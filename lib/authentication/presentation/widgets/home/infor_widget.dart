import 'package:firebase_authentication/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class InforWidget extends StatelessWidget {
  final void Function()? onPressed;
  const InforWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Align(
        alignment: Alignment.topRight,
        child: Material(
          color: Colors.transparent,
          child: IconButton(
            icon: const Icon(
              Icons.info_outline,
              color: AppColors.black,
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
