import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as badges;
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_order_app_flutter/screens/cart%20item/cart_view.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/constants/string.dart';
import 'package:grocery_order_app_flutter/screens/categories%20view/categories_view.dart';
import 'package:grocery_order_app_flutter/screens/home%20view/home_content.dart';
import 'package:grocery_order_app_flutter/screens/profile/profile_menu.dart';

import '../cart item/cart.list.dart';
import '../favorite view/favorite_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Navigation Bar Icons
  final item = [
    Icon(
      FontAwesomeIcons.home,
      color: AppDarkColors.black1,
    ),
    Icon(Icons.category_outlined, color: AppDarkColors.black1),
    Icon(FontAwesomeIcons.heart, color: AppDarkColors.black1),
    Icon(Icons.more_vert, color: AppDarkColors.black1),
  ];
  // Condition for navigationbar
  int index = 0;
  navigateScreen(selectedIndex) {
    setState(() {
      index = selectedIndex;
    });
  }

  // searchIcon() {
  //     if (index == 1) {
  //       const Icon(Icons.search);
  //     }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // AppBar
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8, top: 12),
          child: Text(
            AppText.appBarText,
            style: CustomTextStyle22.h1SemiBold22,
          ),
        ),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 20, top: 12),
          //   child: searchIcon(),
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 12),
            child: badges.Badge(
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
                  icon: const Icon(Icons.shopping_bag_outlined)),
            ),
            // child: Image.asset("assets/images/logo.png"),
          ),
        ],
      ),
      // Navigation Bar Implementation
      bottomNavigationBar: CurvedNavigationBar(
        items: item,
        index: index,
        onTap: (selectedIndex) {
          navigateScreen(selectedIndex);
        },
        animationDuration: const Duration(milliseconds: 300),
        color: AppColors.blue,
        backgroundColor: Colors.transparent,
        // animationCurve: Curves.slowMiddle,
      ),
      // Body Content
      body: SafeArea(child: getSelectedWidget(index: index)),
    );
  }

  // Condition for NavigationBar for different pages content
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
        widget = const FavoriteView();
        break;
      default:
        widget = const ProfileMenu();
        break;
    }
    return widget;
  }
}

// customAppBar({IconData? iconS}) {
//   return 
// }
// Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartView(),));
