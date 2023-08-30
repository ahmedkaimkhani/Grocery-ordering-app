import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

class CustomDealDesign extends StatelessWidget {
  final String text;
  final String text2;
  final String text3;
  final Color? color;
  const CustomDealDesign(
      {super.key,
      required this.text,
      required this.text2,
      required this.text3,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color ?? AppColors.orangeLite,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    text,
                    style: CustomTextStyle26.h1Bold26,
                  ),
                  Text(
                    text2,
                    style: CustomTextStyle26.h1Bold26,
                  )
                ],
              ),
              Text(
                text3,
                style: CustomTextStyle26.h1Bold26,
              )
            ],
          ),
        ),
      ),
    );
  }
}
