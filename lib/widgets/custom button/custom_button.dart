import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final TextStyle? buttonTextColor;
  final Color? buttonColor;
  final IconData? buttonIcon;
  final Function()? onPressed;
  const CustomButton(
      {super.key,
      required this.buttonText,
      this.buttonColor,
      this.buttonIcon,
      this.buttonTextColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: buttonColor ?? AppColors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: AppColors.blue)),
      ),
      child: Text(
        buttonText,
        style: buttonTextColor ?? CustomTextStyle14.h1SemiBold14,
      ),
    );
  }
}
