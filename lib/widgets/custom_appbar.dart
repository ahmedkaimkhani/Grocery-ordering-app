import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

class CustomWhiteAppBar extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final IconData? iconCart;
  const CustomWhiteAppBar({super.key, this.title, this.icon, this.iconCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 50, bottom: 25),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppDarkColors.black10,
            radius: 20,
            child: IconButton(
                onPressed: () {},
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
          IconButton(
              onPressed: () {},
              icon: Icon(
                iconCart,
                size: 22,
                color: AppDarkColors.black100,
              )),
        ],
      ),
    );
  }
}
