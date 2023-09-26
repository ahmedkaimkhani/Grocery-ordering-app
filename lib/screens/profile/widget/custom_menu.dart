import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

class CustomMenu extends StatelessWidget {
  final String title;
  final IconData? icon;
  const CustomMenu({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: AppColors.blue,
              child: Icon(icon),
            ),
          ),
          title: Text(title, style: CustomTextStyle16.h1SemiBold16),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Divider(),
        )
      ],
    );
  }
}
