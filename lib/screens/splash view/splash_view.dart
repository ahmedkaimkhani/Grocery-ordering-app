import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/screens/login&signup/login_view.dart';
import 'package:grocery_order_app_flutter/screens/splash%20view/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash.png',
              height: 250,
              width: 250,
            ),
            Column(
              children: [
                Text(
                  'G R O C E R Y',
                  style: CustomTextStyle30.h1Bold30,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'ODERING APP',
                  style: CustomTextStyle22.h1SemiBold22,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
