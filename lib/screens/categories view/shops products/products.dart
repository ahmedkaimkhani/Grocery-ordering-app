import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_textstyle.dart';

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
            child: Padding(
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
            itemCount: shopData['product'].length,
            itemBuilder: (context, index) {
              final product = shopData['product'][index];
              return Container(
                decoration: BoxDecoration(
                  // color: Colors.grey,
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
                            child: Image.asset(
                              product['image'],
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 6,
                            right: 6,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: AppColors.blue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 18,
                                  color: AppDarkColors.black1,
                                ),
                              ),
                            ),
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
        )),
      ]),
    );
  }
}

  //  ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: shopData['product'].length,
          //   itemBuilder: (context, index) {
          //     final product = shopData['product'][index];
          //     return ListTile(
          //       title: Text(product['productname']),
          //       subtitle: Text(product['price']),
          //       // You can add more product details here if needed
          //     );
          //   },
          // ),