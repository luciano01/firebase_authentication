import 'package:firebase_authentication/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final String label;
  final IconData icon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const TextFormFieldWidget({
    Key? key,
    required this.focusNode,
    required this.keyboardType,
    required this.label,
    required this.icon,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        focusNode: focusNode,
        cursorColor: AppColors.deepOrange300,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: focusNode.hasFocus
                ? AppColors.deepOrange300
                : AppColors.grey600,
          ),
          label: Text(label),
          labelStyle: TextStyle(
            color: focusNode.hasFocus
                ? AppColors.deepOrange300
                : AppColors.grey600,
          ),
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.grey600,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.deepOrange300,
            ),
          ),
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
