import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final IconData? icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    Key? key,
    required this.title,
    this.icon,
    this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
        focusedBorder: InputBorder.none,
        prefixIcon: Icon(
          icon,
          color: AppColors.blue,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppDarkColors.black10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppDarkColors.black10),
        ),
      ),
      validator: validator,
    );
  }
}
