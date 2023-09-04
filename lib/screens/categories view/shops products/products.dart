import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/screens/categories%20view/model/shops_products.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

class ShopProductsView extends StatelessWidget {
  ShopProductsView({super.key});
  List<String> getShopNames() {
    List<String> shopNames = [];
    for (var category in data) {
      for (var shop in category['shops']) {
        shopNames.add(shop['shopname']);
      }
    }
    return shopNames;
  }

  @override
  Widget build(BuildContext context) {
    List<String> shopNames = getShopNames();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomWhiteAppBar(
              title: shopNames.toString(),
              icon: Icons.search,
            ),
          ],
        ),
      ),
    );
  }
}
