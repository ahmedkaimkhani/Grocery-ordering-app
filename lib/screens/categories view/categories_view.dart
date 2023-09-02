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
  Map<String, dynamic>? selectedShop;

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
                            label: Text(categoryData['category']),
                            selected:
                                selectedCategory == categoryData['category'],
                            backgroundColor: AppColors.orange,
                            onSelected: (selected) {
                              setState(() {
                                selectedCategory =
                                    selected ? categoryData['category'] : null;
                                selectedShop = null;
                              });
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  selected() {
    if (selectedCategory != null) {
      Column(
        children: [
          Text(
            'Shops in $selectedCategory:',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          // Display shops in the selected category
          _buildShopList(),
        ],
      );
    }
  }

  Widget _buildShopList() {
    // Find the data for the selected category
    final categoryData = data.firstWhere(
      (category) => category['category'] == selectedCategory,
    );

    // Extract the list of shops within the selected category
    final List<Map<String, dynamic>> shops = categoryData['shops'];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: shops.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(shops[index]['name']),
          onTap: () {
            setState(() {
              selectedShop = shops[index];
            });
          },
        );
      },
    );
  }
}
