import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/screens/checkout%20view/address%20view/take_address_view.dart';
import 'package:grocery_order_app_flutter/widgets/custom%20button/custom_button.dart';

import '../../constants/custom_textstyle.dart';
import '../../widgets/custom_appbar.dart';
import '../cart item/cart.list.dart';

List address = [];

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomWhiteAppBar(title: 'Shopping Cart (${myCart.length})'),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Delivery Address',
                  style: CustomTextColor16.h1RegularBlack,
                ),
              ),
            ),
            ListView.builder(
              itemCount: address.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                  child: Container(
                    // height: 95,
                    decoration: BoxDecoration(
                        // color: AppDarkColors.black20,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.orange, width: 2)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: ListTile(
                          // tileColor: AppDarkColors.black20,
                          title: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 18),
                                child: Text(
                                  'Home',
                                  style: CustomTextStyle14.h1Regular14,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 18),
                                child: Icon(
                                  Icons.check_circle,
                                  color: AppColors.orange,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              Text(
                                address[index].toString(),
                                style: CustomTextStyle14.h1SemiBold14,
                              ),
                              const Spacer(),
                              Text(
                                'Edit',
                                style: CustomTextStyle12.h1Medium12Blue,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              width: width * 0.85,
              child: CustomButton(
                buttonIcon: Icons.add_circle_outline,
                buttonText: 'Add New Address',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddressView(),
                  ));
                },
                buttonTextStyle: CustomTextStyle14.h1Regular14,
                buttonColor: AppDarkColors.black1,
              ),
            ),
            SizedBox(
              width: width * 0.90,
              child: CustomButton(
                buttonText: 'Add Card',
                onPressed: () {},
                buttonTextStyle: CustomTextStyle14.h1Medium14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
