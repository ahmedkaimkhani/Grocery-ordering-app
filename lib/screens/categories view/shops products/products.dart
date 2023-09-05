import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

class ShopProductsPage extends StatelessWidget {
  final Map<String, dynamic> shopData;

  ShopProductsPage({required this.shopData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomWhiteAppBar(
          title: shopData['shopname'],
          icon: Icons.search,
          iconCart: Icons.shopping_bag_outlined,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: shopData['product'].length,
            itemBuilder: (context, index) {
              final product = shopData['product'][index];
              return ListTile(
                title: Text(product['productname']),
                subtitle: Text(product['price']),
                // You can add more product details here if needed
              );
            },
          ),
        ),
      ]),
    );
  }
}
