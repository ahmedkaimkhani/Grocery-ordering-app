import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonTextColor;
  final Color? buttonColor;
  final IconData? buttonIcon;
  const CustomButton(
      {super.key,
      required this.buttonText,
      this.buttonColor,
      this.buttonIcon,
      this.buttonTextColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: AppColors.blue)),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              buttonText,
              style: CustomTextStyle16.h1SemiBold16,
            ),
          ],
        ),
      ),
    );
  }
}
