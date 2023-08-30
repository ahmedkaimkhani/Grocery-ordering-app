import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/constants/string.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            AppText.appBarText,
            style: CustomTextStyle22.h1SemiBold22,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(FontAwesomeIcons.cartShopping),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.blue,
            width: double.infinity,
            height: 200,
            child: const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search Products or store',
                    border: InputBorder.none,
                    fillColor: Color(0xff153075)),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            FontAwesomeIcons.home,
            color: AppDarkColors.black1,
          ),
          Icon(Icons.category_outlined, color: AppDarkColors.black1),
          Icon(FontAwesomeIcons.heart, color: AppDarkColors.black1),
          Icon(Icons.more_vert, color: AppDarkColors.black1),
        ],
        animationDuration: Duration(milliseconds: 300),
        color: AppColors.blue,
        backgroundColor: AppDarkColors.black1,
      ),
    );
  }
}
