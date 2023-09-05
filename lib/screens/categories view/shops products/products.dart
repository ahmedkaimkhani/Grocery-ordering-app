import 'package:flutter/material.dart';

class ShopProductsPage extends StatelessWidget {
  final Map<String, dynamic> shopData;

  ShopProductsPage({required this.shopData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shopData['shopname']),
      ),
      body: ListView.builder(
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
    );
  }
}
