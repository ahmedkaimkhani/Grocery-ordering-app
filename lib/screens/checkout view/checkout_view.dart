import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Column(
        children: [
          CustomWhiteAppBar(title: 'Shopping Cart (${myCart.length})'),
        ],
      ),
    );
  }
}
