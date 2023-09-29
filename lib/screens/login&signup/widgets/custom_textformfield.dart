import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
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
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.title,
            focusedBorder: InputBorder.none,
            prefixIcon: Icon(
              widget.icon,
              color: AppColors.blue,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppDarkColors.black10),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppDarkColors.black10),
            ),
          ),
        ),
      ),
    );
  }
}
