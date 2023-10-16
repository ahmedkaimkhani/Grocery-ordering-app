import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/screens/orders/order_list.dart';

import '../../../constants/custom_textstyle.dart';

class PastContent extends StatelessWidget {
  const PastContent({super.key});

  @override
  Widget build(BuildContext context) {
    return myOrder.isEmpty
        ? Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/emptyrider.gif',
                  height: 300,
                  width: 300,
                ),
                Text(
                  'Make your order now!',
                  style: CustomTextStyle18.h1Bold318,
                ),
              ],
            ),
          )
        : Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://w7.pngwing.com/pngs/1018/975/png-transparent-juice-banana-food-auglis-flavor-banana-natural-foods-leaf-orange-thumbnail.png'),
                        ),
                        title: Text(
                          'Bananas',
                          style: CustomTextStyle14.h1Medium14Grey,
                        ),
                        subtitle: Text(
                          '\$55.50',
                          style: CustomTextStyle14.h1SemiBold14,
                        ),
                        trailing: Text(
                          'ID: #765433',
                          style: CustomTextStyle14.h1SemiBold14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Text(
                              '20/082023',
                              style: CustomTextStyle14.h1Medium14Grey,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppDarkColors.black10),
                            ),
                            child: Text(
                              'Success',
                              style: CustomTextStyle12.h1Medium12Blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                      child: Divider(),
                    )
                  ],
                );
              },
            ),
          );
  }
}
