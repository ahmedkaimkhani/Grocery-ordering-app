import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/screens/orders/orders%20&%20past%20content/past_content.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

import 'orders & past content/orders_content.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  int selectedTapIndex = 1;

  void tappedButton(int index) {
    setState(() {
      selectedTapIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomWhiteAppBar(
          title: 'Orders',
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, bottom: 40, top: 30),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => tappedButton(1),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: selectedTapIndex == 1
                            ? AppColors.orange
                            : AppDarkColors.black1,
                        borderRadius: BorderRadius.circular(60),
                        border: selectedTapIndex == 1
                            ? null
                            : Border.all(
                                color: AppDarkColors.black60, width: 0.5)),
                    child: Center(
                        child: Text(
                      'Orders',
                      style: selectedTapIndex == 1
                          ? CustomTextStyle14.h1Medium14
                          : CustomTextStyle14.h1Medium14Grey,
                    )),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: InkWell(
                  onTap: () => tappedButton(2),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: selectedTapIndex == 2
                            ? AppColors.orange
                            : AppDarkColors.black1,
                        borderRadius: BorderRadius.circular(60),
                        border: selectedTapIndex == 2
                            ? null
                            : Border.all(
                                color: AppDarkColors.black60, width: 0.5)),
                    child: Center(
                        child: Text(
                      'Past',
                      style: selectedTapIndex == 2
                          ? CustomTextStyle14.h1Medium14
                          : CustomTextStyle14.h1Medium14Grey,
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          child: selectedTapIndex == 1
              ? const OrderContent()
              : const PastContent(),
        )
      ],
    );
  }
}
