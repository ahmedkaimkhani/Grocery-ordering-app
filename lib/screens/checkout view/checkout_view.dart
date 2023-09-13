import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/widgets/custom%20button/custom_button.dart';

import '../../constants/custom_textstyle.dart';
import '../../widgets/custom_appbar.dart';
import '../cart item/cart.list.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          CustomWhiteAppBar(title: 'Shopping Cart (${myCart.length})'),
          SizedBox(
            width: width * 0.90,
            child: CustomButton(
              buttonIcon: Icons.add_circle_outline,
              buttonText: 'Add New Address',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CheckoutView(),
                ));
              },
              buttonTextStyle: CustomTextStyle14.h1Regular14,
            ),
          )
        ],
      ),
    );
  }
}
