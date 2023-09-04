import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/app_fonts.dart';
import 'package:grocery_order_app_flutter/screens/categories%20view/shops%20products/products.dart';
import 'package:grocery_order_app_flutter/screens/get%20started%20view/get_started_1.dart';
import 'package:grocery_order_app_flutter/screens/home%20view/widgets/grid_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Grocery App',
        theme: ThemeData(
            backgroundColor: AppDarkColors.black1,
            appBarTheme: AppBarTheme(
              color: AppColors.blue,
            )),
        home: ShopProductsView()
        // GetStartedView(),
        );
  }
}
