import 'package:flutter/material.dart';

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
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 25,
                  ),
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
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
