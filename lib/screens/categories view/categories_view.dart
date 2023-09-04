import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/constants/string.dart';
import 'package:grocery_order_app_flutter/screens/categories%20view/model/shops_products.dart';

import '../../constants/app_colors.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  String? selectedCategory;
  // late Map<String, dynamic> selectedShop;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 155,
              width: double.infinity,
              color: AppColors.blue,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppText.categoryPageText1,
                      style: CustomTextStyle45.h1Regular50,
                    ),
                    Text(
                      AppText.categoryPageText2,
                      style: CustomTextStyle45.h1Bold50,
                    )
                  ],
                ),
              )),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 20, right: 12, bottom: 20),
              child: Row(
                children: data
                    .map((categoryData) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            showCheckmark: false,
                            selectedColor: AppColors.orange,
                            selected:
                                selectedCategory == categoryData['category'],
                            backgroundColor: AppDarkColors.black1,
                            label: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                categoryData['category'],
                              ),
                            ),
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  selectedCategory = categoryData['category'];
                                } else {
                                  selectedCategory = null;
                                }
                              });
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          if (selectedCategory != null)
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // Display shops in the selected category
                  _buildShopList(selectedCategory!),
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget _buildShopList(String category) {
    final categoryData = data.firstWhere(
      (categoryData) => categoryData['category'] == category,
    );

    final List<Map<String, dynamic>> shops = categoryData['shops'];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: shops.length,
      itemBuilder: (context, index) {
        final shopData = shops[index];
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                height: 165,
                width: 135,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    shopData['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 145,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shopData['shopname'],
                        style: CustomTextStyle18.h1Bold318,
                        softWrap: true,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(shopData['subtitle'],
                          style: CustomTextColor16.h1Regular16),
                      const Spacer(),
                      Text(
                        AppText.byShopCtgPageText,
                        style: CustomTextStyle14.h1Regular14,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        shopData['price'],
                        style: CustomTextColor16.h1SemiBold16,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

// ListTile(
          // title: Text(shopData['shopname']),
          // subtitle: Text(shopData['subtitle']),
//           // You can add more shop details here if needed
//           onTap: () {
//             // Handle shop selection if needed
//           },
//         );
