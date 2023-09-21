import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

import '../get started view/get_started_1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(
      const Duration(seconds: 5),
      () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const GetStartedView(),
            ));
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
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
