import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/screens/categories%20view/model/shops_products.dart';
import 'package:grocery_order_app_flutter/screens/home%20view/widgets/grid_item.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

class ShopProductsView extends StatelessWidget {
  ShopProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: const [
                CustomWhiteAppBar(
                  title: '',
                  icon: Icons.search,
                  iconCart: Icons.shopping_bag_outlined,
                ),
                CustomGridViewItem(
                  productName: '\$900',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
