import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/screens/home%20view/widgets/custom_deal.dart';
import 'package:grocery_order_app_flutter/screens/home%20view/widgets/grid_item.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_textstyle.dart';
import '../../list item data/deals_fruit_tea.dart';
import 'widgets/custom_popmenu.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeContent> {
  List<Map<String, dynamic>> foundProduct = [];
  @override
  void initState() {
    foundProduct = dealItems;
    super.initState();
  }

  void runFilter(String enterdKeyWord) {
    List<Map<String, dynamic>> results = [];
    if (enterdKeyWord.isEmpty) {
      results = dealItems;
    } else {
      results = dealItems
          .where((product) => product['name']
              .toLowerCase()
              .contains(enterdKeyWord.toLowerCase()))
          .toList();
    }
    setState(() {
      foundProduct = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 155,
          width: double.infinity,
          color: AppColors.blue,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 25),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.textFieldColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 7),
                    child: customTextField(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 4),
                child: Row(
                  children: [
                    Text(
                      'DELIVERY TO',
                      style: CustomTextStyle11.fonts11w8,
                    ),
                    const Spacer(),
                    Text('WITHIN', style: CustomTextStyle11.fonts11w8)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 4),
                child: Row(
                  children: [
                    Text(
                      'Green Way 3000, Sylhet',
                      style: CustomTextStyle14.h1Medium14,
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: PopupMenuButton(
                        color: const Color(0xff1F2C34),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: Text(
                              'Green Way 4000, Karachi',
                              style: CustomTextStyle14.h1Medium14,
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Text('Green Way 5000, Lahore',
                                style: CustomTextStyle14.h1Medium14),
                          ),
                          PopupMenuItem(
                            value: 3,
                            child: Text('Green Way 600, Islamabad',
                                style: CustomTextStyle14.h1Medium14),
                          ),
                        ],
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: AppDarkColors.black1,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text('1 Hour', style: CustomTextStyle14.h1Medium14),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: AppDarkColors.black1,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // const SizedBox(
        //   height: 20,
        // ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                          child: CustomDealDesign(
                              text: '346',
                              text2: 'USD',
                              text3: 'Your total savings')),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: CustomDealDesign(
                        text: '215',
                        text2: 'HRS',
                        text3: 'Your time saved',
                        color: AppDarkColors.black10,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Deals on Fruits & Tea',
                    style: CustomTextStyle20.h1Bold20,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  CustomGridViewItem(
                    foundProduct: foundProduct,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Serach bar
  TextField customTextField() {
    return TextField(
        onChanged: (value) {
          runFilter(value);
        },
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            size: 30,
            color: AppDarkColors.black1,
          ),
          hintText: 'Search Products or store',
          hintStyle: CustomTextFieldStyle.h1Medium14,
          border: InputBorder.none,
        ),
        style: CustomTextFieldStyle.h2Medium14);
  }
}
