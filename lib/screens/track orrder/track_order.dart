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
                    child: Stack(children: [
                      Container(
                        height: 350,
                        color: AppDarkColors.black45,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            'assets/images/map.jpg',
                            width: double.infinity,
                            height: 350,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
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
                              style: CustomTextStyle14.h1Medium14Grey,
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
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.timer_outlined),
              title: Text(
                'Delivery In',
                style: CustomTextStyle14.h1Medium14Grey,
              ),
              subtitle: Text(
                '25 Min',
                style: CustomTextStyle14.h1SemiBold14,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: Text(
                'Delivery Address',
                style: CustomTextStyle14.h1Medium14Grey,
              ),
              subtitle: Text(
                '37 New line, Sunamganj',
                style: CustomTextStyle14.h1SemiBold14,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 10,
                width: 100,
                color: AppColors.orangeLite,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 25, right: 25),
              child: Row(
                children: [
                  Text(
                    'Order Details ',
                    style: CustomTextStyle14.h1SemiBold14,
                  ),
                  Text(
                    '(ID: #765433)',
                    style: CustomTextStyle14.h1Medium14Grey,
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
