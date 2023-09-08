import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/cart%20item/cart.list.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/screens/categories%20view/model/shops_products.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomWhiteAppBar(
            title: 'Shopping Cart (${myCart.length})',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      // radius: 24,
                      backgroundImage: NetworkImage(
                        'https://qtxasset.com/quartz/qcloud1/media/image/4%20-%20Bigelow%20Tea.jpg?VersionId=HB4ZJUy7MjvK6E4MiWLAk544qcwz4MMe',
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Apple',
                        style: CustomTextStyle14.h1SemiBold14,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '\$90',
                        style: CustomTextStyle14.h1Regular14,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
