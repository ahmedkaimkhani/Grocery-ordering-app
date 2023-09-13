import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

import '../../../widgets/custom_appbar.dart';
import '../../cart item/cart.list.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 30,
          ),
          const CustomWhiteAppBar(title: 'Address'),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Text(
              'Delivery Address',
              style: CustomTextColor16.h1RegularBlack,
            ),
          )
        ],
      ),
    );
  }
}
