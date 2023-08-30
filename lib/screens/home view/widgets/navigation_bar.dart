import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: [
        Icon(
          FontAwesomeIcons.home,
          color: AppDarkColors.black1,
        ),
        Icon(Icons.category_outlined, color: AppDarkColors.black1),
        Icon(FontAwesomeIcons.heart, color: AppDarkColors.black1),
        Icon(Icons.more_vert, color: AppDarkColors.black1),
      ],
      animationDuration: const Duration(milliseconds: 300),
      color: AppColors.blue,
      backgroundColor: AppDarkColors.black1,
    );
  }
}
