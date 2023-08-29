import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  const CustomButton({super.key, required this.buttonText, this.buttonColor});

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
      child: Text(buttonText),
    );
  }
}
