import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

import '../../../constants/app_colors.dart';

class Custom1stButton extends StatelessWidget {
  const Custom1stButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppDarkColors.black1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Get Started', style: CustomTextStyle16.h1SemiBold16),
          const Icon(
            Icons.arrow_forward,
            color: Color(0xff1E222B),
          ),
        ],
      ),
    );
  }
}
