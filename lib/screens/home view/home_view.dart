import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/constants/string.dart';
import 'package:grocery_order_app_flutter/screens/home%20view/widgets/appbar.dart';
import 'package:grocery_order_app_flutter/screens/home%20view/widgets/navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Column(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            color: AppColors.blue,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 30, bottom: 25),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.textFieldColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 7),
                      child: customTextField(),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 4),
                  child: Row(
                    children: [
                      Text(
                        'DELIVERY TO',
                        style: CustomTextStyle11.fonts11w8,
                      ),
                      const Spacer(),
                      Text('WITHIN', style: CustomTextStyle11.fonts11w8)
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 4),
                  child: Row(
                    children: [
                      Text(
                        'Green Way 3000, Sylhet',
                        style: CustomTextStyle14.h1Medium14,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: AppDarkColors.black1,
                        ),
                      ),
                      const Spacer(),
                      Text('1 Hour', style: CustomTextStyle14.h1Medium14),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: AppDarkColors.black1,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }

  // Serach bar
  TextField customTextField() {
    return TextField(
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            size: 30,
            color: AppDarkColors.black1,
          ),
          hintText: 'Search Products or store',
          hintStyle: CustomTextFieldStyle.h1Medium14,
          border: InputBorder.none,
        ),
        style: CustomTextFieldStyle.h2Medium14);
  }
}
