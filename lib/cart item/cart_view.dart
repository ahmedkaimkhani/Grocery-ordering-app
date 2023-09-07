import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/cart%20item/cart.list.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
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
          ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(''),
                title: Text(
                  'Apple',
                  style: CustomTextStyle14.h1Medium14,
                ),
                subtitle: Text(
                  '\$90',
                  style: CustomTextStyle14.h1Regular14,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
