import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

class CustomMenu extends StatelessWidget {
  final String title;
  final IconData? icon;
  const CustomMenu({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ListTile(
            tileColor: AppDarkColors.black10,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: AppColors.blue,
                child: Icon(icon),
              ),
            ),
            title: Text(title, style: CustomTextColor16.h1RegularBlack),
          ),
          Divider()
        ],
      ),
    );
  }
}
