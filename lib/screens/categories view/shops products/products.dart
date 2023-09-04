import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

class ShopProductsView extends StatelessWidget {
  const ShopProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomWhiteAppBar(),
          ],
        ),
      ),
    );
  }
}
