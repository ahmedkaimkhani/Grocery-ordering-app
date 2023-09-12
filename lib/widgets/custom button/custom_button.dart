import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final TextStyle? buttonTextStyle;
  final Color? buttonColor;
  final IconData? buttonIcon;
  final Function()? onPressed;
  final Padding? height;
  const CustomButton(
      {super.key,
      required this.buttonText,
      this.buttonColor,
      this.buttonIcon,
      this.buttonTextStyle,
      this.onPressed,
      this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: buttonColor ?? AppColors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: AppColors.blue)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          buttonText,
          style: buttonTextStyle ?? CustomTextStyle14.h1SemiBold14,
        ),
      ),
    );
  }
}
