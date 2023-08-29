import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              child: SizedBox(
                height: height * 0.40,
                child: PageView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 40, bottom: 20),
                      child: Column(
                        children: [
                          Text(
                            'Your holiday shopping delivered to Screen one',
                            style: CustomTextStyle30.h1Bold30,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'There\'s something for everyone to enjoy with Sweet Shop Favourites Screen 1',
                            style: CustomTextStyle18.h1Medium18,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
