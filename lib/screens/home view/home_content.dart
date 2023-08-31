import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/screens/home%20view/widgets/custom_deal.dart';
import 'package:grocery_order_app_flutter/screens/home%20view/widgets/deals_item.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_textstyle.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
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
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 7),
                      child: customTextField(),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 4),
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
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 4),
                  child: Row(
                    children: [
                      Text(
                        'Green Way 3000, Sylhet',
                        style: CustomTextStyle14.h1Medium14,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: AppDarkColors.black1,
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
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    height: 35,
                  ),
                  Text(
                    'Deals on Fruits & Tea',
                    style: CustomTextStyle20.h1Bold20,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const DealsItem(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Serach bar
  TextField customTextField() {
    return TextField(
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
