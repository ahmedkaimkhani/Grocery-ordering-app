import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/screens/track%20orrder/track_order.dart';
import 'package:grocery_order_app_flutter/widgets/custom%20button/custom_button.dart';

import '../../../constants/custom_textstyle.dart';
import '../../cart item/cart.list.dart';

class OrderContent extends StatelessWidget {
  const OrderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: myCart.length,
        itemBuilder: (context, index) {
          final cartItem = myCart[index];
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      // radius: 24,
                      backgroundImage: NetworkImage(
                        cartItem['image'],
                      ),
                    ),
                    title: Text(
                      cartItem['productname'],
                      style: CustomTextStyle14.h1Medium14Grey,
                    ),
                    subtitle: Text(
                      cartItem['price'],
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
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                    width: 180,
                                    height: 150,
                                    child: Image.asset(
                                        'assets/images/delivery.png')),
                                const Positioned(
                                  bottom: 15,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      backgroundImage: NetworkImage(
                                          'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg'),
                                      radius: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Meet our rider, ',
                                  style: CustomTextStyle12.h1Regular12,
                                ),
                                Text(
                                  'Rakib',
                                  style: CustomTextStyle14.h1SemiBold14,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Product',
                              style: CustomTextStyle20.h1Regular20,
                            ),
                            Text(
                              'are on the way',
                              style: CustomTextStyle20.h1SemiBold20,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomButton(
                              buttonText: 'Track Order',
                              buttonTextStyle: CustomTextStyle14.h1Medium14,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const TrackOrder(),
                                ));
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 20),
                  child: Divider(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
