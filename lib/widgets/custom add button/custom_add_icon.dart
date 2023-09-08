import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  const CustomIconButton(
      {super.key,
      this.height,
      this.width,
      this.color,
      this.icon,
      this.iconColor,
      this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 25,
      width: width ?? 25,
      decoration: BoxDecoration(
        color: color ?? AppColors.blue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        icon ?? Icons.add,
        size: iconSize ?? 15,
        color: iconColor ?? AppDarkColors.black1,
      ),
    );
  }
}
