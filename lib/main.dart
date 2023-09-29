import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'screens/login&signup/login_view.dart';

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
          scaffoldBackgroundColor: AppDarkColors.black1,
          appBarTheme: AppBarTheme(
            color: AppColors.blue,
          )),
      home: const LoginView(),
    );
  }
}
