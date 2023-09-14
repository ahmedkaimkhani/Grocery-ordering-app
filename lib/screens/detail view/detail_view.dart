import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomWhiteAppBar(
            iconCart: Icons.shopping_bag_outlined,
          ),
          Stack(
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(100)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/fruit1.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thin Choice Top Orange',
                  style: CustomTextStyle20.h1Bold20,
                ),
                Icon(
                  Icons.favorite,
                  color: AppDarkColors.black60,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$34.70/KG',
                  style: CustomTextStyle14.h1Regular14,
                ),
                Container(
                  width: 80,
                  decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Center(
                      child: Text(
                        '\$22.04 OFF',
                        style: CustomTextStyle12.h1Regular12White,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Reg: \$56.70 USD',
                  style: CustomTextStyle12.h1Medium12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
