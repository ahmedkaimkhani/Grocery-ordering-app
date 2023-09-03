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
                  left: 20, top: 20, right: 12, bottom: 25),
              child: Row(
                children: data
                    .map((categoryData) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            selected:
                                selectedCategory == categoryData['category'],
                            backgroundColor: AppColors.orange,
                            label: Text(categoryData['category']),
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
                  SizedBox(height: 10),
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
        return Container(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 30,
            ),
            child: Row(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shopData['shopname'],
                      style: CustomTextStyle18.h1Bold318,
                      softWrap: true,
                    ),
                    Text(shopData['subtitle']),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
  // condition() {
  //   if (selectedCategory.isNotEmpty) {
  //     Column(
  //       children: [
  //         Text(
  //           'Shops in $selectedCategory:',
  //           style: TextStyle(fontSize: 18),
  //         ),
  //       ],
  //     );
  //   }
  // }
}

// ListTile(
          // title: Text(shopData['shopname']),
          // subtitle: Text(shopData['subtitle']),
//           // You can add more shop details here if needed
//           onTap: () {
//             // Handle shop selection if needed
//           },
//         );
