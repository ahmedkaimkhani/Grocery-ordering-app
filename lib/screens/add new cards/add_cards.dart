import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/screens/home%20view/home_view.dart';
import 'package:grocery_order_app_flutter/screens/orders/order_view.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';
import 'package:lottie/lottie.dart';

import '../../constants/custom_textstyle.dart';
import '../../widgets/custom button/custom_button.dart';
import '../cart item/cart.list.dart';
import '../checkout view/widgets/custom_textfield.dart';
import '../orders/order_list.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  // parse price to covert String to double
  double parsePrice(String price) {
    return double.parse(price.replaceAll('\$', ''));
  }

  // Calculate subtotal
  double calculateSubtotal() {
    double subtotal = 0.00;
    for (final cartItem in myCart) {
      double itemPrice = parsePrice(cartItem['price']);
      int quantity = cartItem['quantity'];
      subtotal += itemPrice * quantity;
    }
    return subtotal;
  }

  double calculateTotal() {
    double deliveryCost = 2.00;
    return calculateSubtotal() + deliveryCost;
  }

  addCartToOrder() {
    myOrder.addAll(myCart);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //removed overflow erro when keyboard launches for input fields
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomWhiteAppBar(
                title: 'Add Card',
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 40),
                child: CustomTextField(
                  textName: 'Card holder name',
                  hintText: 'Card holder name',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: CustomTextField(
                  textName: 'Card Number',
                  hintText: 'Card Number',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        textName: 'Exp Date',
                        hintText: 'Exp Date',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextField(
                        textName: 'CVc',
                        hintText: 'CVc Number',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 110,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Container(
                  height: 225,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppDarkColors.black10,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: SizedBox(
                    width: width * 0.90,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, bottom: 15, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: CustomTextStyle12.h1Medium12,
                              ),
                              Text(
                                '\$${calculateSubtotal().toStringAsFixed(2)}',
                                style: CustomTextStyle14.h1SemiBold14,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery',
                                style: CustomTextStyle12.h1Medium12,
                              ),
                              Text(
                                '\$2.00',
                                style: CustomTextStyle14.h1SemiBold14,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, bottom: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: CustomTextStyle12.h1Medium12,
                              ),
                              Text(
                                '\$${calculateTotal().toStringAsFixed(2)}',
                                style: CustomTextStyle14.h1SemiBold14,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 0.90,
                          child: CustomButton(
                            buttonText: 'Proceed To checkout',
                            onPressed: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.zero,
                                    shape: const RoundedRectangleBorder(),
                                    content: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30,
                                            bottom: 30,
                                            left: 30,
                                            right: 30),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              child: Lottie.asset(
                                                'assets/animation/payment.json',
                                                height: 100,
                                                width: 100,
                                                repeat: false,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            Text(
                                              'Payment Successful',
                                              style:
                                                  CustomTextStyle18.h1Bold318,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                              addCartToOrder();
                              myCart.clear();
                              Future.delayed(
                                const Duration(seconds: 2),
                                () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const HomeView(),
                                      ));
                                },
                              );
                            },
                            buttonTextStyle: CustomTextStyle14.h1Medium14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
