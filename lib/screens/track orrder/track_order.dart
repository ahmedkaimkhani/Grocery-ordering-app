import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

import '../../constants/custom_textstyle.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomWhiteAppBar(
              title: 'Track Order',
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: 400,
                      color: Colors.amber,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Stack(children: [
                          Image.asset(
                            'assets/images/map.jpg',
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.orangeLite,
                              ),
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  backgroundImage: NetworkImage(
                                    'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg',
                                  ),
                                  radius: 24,
                                ),
                                title: Text(
                                  'Delivery Man',
                                  style: CustomTextStyle12.h1Regular12,
                                ),
                                subtitle: Text(
                                  'Rakibul Hassan',
                                  style: CustomTextStyle18.h1SemiBold18,
                                ),
                                trailing: Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      color: AppColors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Icon(
                                    Icons.chat_outlined,
                                    color: AppDarkColors.black1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
