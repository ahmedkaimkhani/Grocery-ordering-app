import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/screens/detail%20view/detail_view.dart';
import 'package:grocery_order_app_flutter/widgets/custom%20add%20button/custom_add_icon.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

import '../../../widgets/custom_alertdialog.dart';
import '../../../widgets/custom_snackbar.dart';
import '../../cart item/cart.list.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/custom_textstyle.dart';

class ShopProductsPage extends StatefulWidget {
  final Map<String, dynamic> shopData;

  const ShopProductsPage({super.key, required this.shopData});

  @override
  State<ShopProductsPage> createState() => _ShopProductsPageState();
}

class _ShopProductsPageState extends State<ShopProductsPage> {
  // Add to cart method
  addToCart(
    Map<String, dynamic> product,
  ) {
    // if products already exist than..
    if (myCart.contains(product)) {
      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog(message: 'Item is already added in cart...');
        },
      );
    } else {
      myCart.add(product);
      showSnackBar(context: context, message: 'Item added to cart');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(children: [
          CustomWhiteAppBar(
            title: widget.shopData['shopname'],
            icon: Icons.search,
            iconCart: Icons.shopping_bag_outlined,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                mainAxisExtent: 210,
              ),
              itemCount: widget.shopData['product'].length,
              itemBuilder: (context, index) {
                final product = widget.shopData['product'][index];
                return Container(
                  decoration: BoxDecoration(
                    color: AppDarkColors.black10,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: Center(
                          child: Stack(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) =>
                                        DetailView(shopProducts: product),
                                  ));
                                  setState(() {});
                                },
                                child: Hero(
                                  tag: product,
                                  transitionOnUserGestures: true,
                                  child: Image.network(
                                    product['image'],
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 6,
                              right: 6,
                              child: InkWell(
                                  onTap: () {
                                    addToCart(
                                      product,
                                    );
                                  },
                                  child: const CustomIconButton()),
                            )
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 6, right: 6, bottom: 6),
                        child: Text(
                          product['price'],
                          style: CustomTextStyle18.h1Bold318,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6, right: 6),
                        child: Text(
                          product['productname'],
                          style: CustomTextStyle14.h1Regular14,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
