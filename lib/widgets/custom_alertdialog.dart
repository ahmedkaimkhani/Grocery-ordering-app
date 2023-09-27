import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

class CustomAlertDialog extends StatelessWidget {
  final String message;

  CustomAlertDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: AppColors.orangeLite,
      content: Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          message,
          style: CustomTextStyle16.h1Medium16,
        ),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppDarkColors.black1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Text('Cancel', style: CustomTextStyle16.h1SemiBold16),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
