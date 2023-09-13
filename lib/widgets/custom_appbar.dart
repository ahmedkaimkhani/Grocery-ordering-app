import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/screens/cart%20item/cart.list.dart';

import '../screens/cart item/cart_view.dart';

class CustomWhiteAppBar extends StatefulWidget {
  final String? title;
  final IconData? icon;
  final IconData? iconCart;
  const CustomWhiteAppBar({super.key, this.title, this.icon, this.iconCart});

  @override
  State<CustomWhiteAppBar> createState() => _CustomWhiteAppBarState();
}

class _CustomWhiteAppBarState extends State<CustomWhiteAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 50,
        bottom: 30,
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
            widget.title ?? '',
            style: CustomTextColor16.h1RegularBlack,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(widget.icon, size: 22, color: AppDarkColors.black100)),
          Badge(
            showBadge: myCart.isEmpty ? false : true,
            badgeContent: Text(
              myCart.length.toString(),
              style: CustomTextStyle14.h1Medium14,
            ),
            badgeStyle: BadgeStyle(badgeColor: AppColors.orange),
            position: BadgePosition.topEnd(top: 0, end: 0),
            child: IconButton(
                onPressed: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CartView(),
                  ));
                  setState(() {});
                },
                icon: Icon(
                  widget.iconCart,
                  size: 22,
                  color: AppDarkColors.black100,
                )),
          ),
        ],
      ),
    );
  }
}
