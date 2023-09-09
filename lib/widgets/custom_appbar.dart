import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/screens/cart%20item/cart.list.dart';

import '../screens/cart item/cart_view.dart';

class CustomWhiteAppBar extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final IconData? iconCart;
  const CustomWhiteAppBar({super.key, this.title, this.icon, this.iconCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 50,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppDarkColors.black10,
            radius: 20,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 10,
                  color: AppDarkColors.black100,
                )),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title ?? '',
            style: CustomTextColor16.h1RegularBlack,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(icon, size: 22, color: AppDarkColors.black100)),
          Badge(
            badgeContent: Text(
              myCart.length.toString(),
              style: CustomTextStyle14.h1Medium14,
            ),
            badgeStyle: BadgeStyle(badgeColor: AppColors.orange),
            position: BadgePosition.topEnd(top: 0, end: 0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CartView(),
                  ));
                },
                icon: Icon(
                  iconCart,
                  size: 22,
                  color: AppDarkColors.black100,
                )),
          ),
        ],
      ),
    );
  }
}
