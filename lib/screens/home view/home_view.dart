import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/constants/string.dart';
import 'package:grocery_order_app_flutter/screens/categories%20view/categories_view.dart';
import 'package:grocery_order_app_flutter/screens/home%20view/home_content.dart';
import 'package:grocery_order_app_flutter/screens/home%20view/widgets/navigation_bar.dart';

import 'widgets/appbar_method.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final item = [
    Icon(
      FontAwesomeIcons.home,
      color: AppDarkColors.black1,
    ),
    Icon(Icons.category_outlined, color: AppDarkColors.black1),
    Icon(FontAwesomeIcons.heart, color: AppDarkColors.black1),
    Icon(Icons.more_vert, color: AppDarkColors.black1),
  ];
  int index = 0;
  navigateScreen(selectedIndex) {
    setState(() {
      index = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: CurvedNavigationBar(
        items: item,
        index: index,
        onTap: (selectedIndex) {
          navigateScreen(selectedIndex);
        },
        animationDuration: const Duration(milliseconds: 300),
        color: AppColors.blue,
        backgroundColor: AppDarkColors.black1,
      ),
      body: getSelectedWidget(index: index),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;

    switch (index) {
      case 0:
        widget = const HomeContent();
        break;
      case 1:
        widget = const CategoriesView();
        break;
      case 2:
        widget = const CategoriesView();
        break;
      default:
        widget = const CategoriesView();
        break;
    }
    return widget;
  }
}
