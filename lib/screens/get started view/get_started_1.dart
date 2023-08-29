import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: PageView(
                children: [
                  Container(
                    color: Colors.red,
                    child: Text(
                      'Your holiday shopping delivered to Screen one',
                      style: CustomTextStyles.h1Bold30,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
