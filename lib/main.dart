import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/app_fonts.dart';
import 'package:grocery_order_app_flutter/screens/get%20started%20view/get_started_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',
      theme: ThemeData(
          fontFamily: 'Rubik Regular',
          backgroundColor: AppDarkColors.black1,
          appBarTheme: AppBarTheme(color: AppColors.blue)),
      home: const GetStartedView(),
    );
  }
}
