import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/custom_textstyle.dart';
import '../screens/cart item/cart.list.dart';

class CartBadge extends StatefulWidget {
  final Widget? chilD;
  const CartBadge({super.key, required this.chilD});

  @override
  State<CartBadge> createState() => _CartBadgeState();
}

class _CartBadgeState extends State<CartBadge> {
  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeContent: Text(
        myCart.length.toString(),
        style: CustomTextStyle14.h1Medium14,
      ),
      badgeStyle: BadgeStyle(badgeColor: AppColors.orange),
      position: BadgePosition.topEnd(top: 0, end: 0),
    );
  }
}
