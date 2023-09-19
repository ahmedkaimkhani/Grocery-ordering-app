import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomWhiteAppBar(
              title: 'Orders',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => tappedButton(1),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(60),
                        ),
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
                            color: AppDarkColors.black20,
                            borderRadius: BorderRadius.circular(60)),
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
              child:
                  selectedTapIndex == 1 ? Text('Button One') : Text('Button 2'),
            )
          ],
        ),
      ),
    );
  }
}
