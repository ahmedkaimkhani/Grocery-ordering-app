import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/screens/cart%20item/cart.list.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/screens/checkout%20view/checkout_view.dart';
import 'package:grocery_order_app_flutter/widgets/custom%20add%20button/custom_add_icon.dart';
import 'package:grocery_order_app_flutter/widgets/custom%20button/custom_button.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  decreasedCartQuantity(index) {
    setState(() {
      if (myCart[index]['quantity'] > 1) {
        myCart[index]['quantity']--;
      } else {
        myCart.removeAt(index);
      }
    });
  }

  increaseCartQuantity(index) {
    setState(() {
      myCart[index]['quantity']++;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomWhiteAppBar(
              title: myCart.isNotEmpty
                  ? 'Shopping Cart (${myCart.length})'
                  : 'No Item in Cart',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 30),
                child: myCart.isEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                              'https://cdn.dribbble.com/users/5107895/screenshots/14532312/media/a7e6c2e9333d0989e3a54c95dd8321d7.gif'),
                          Text(
                            'Empty Cart !',
                            style: CustomTextStyle30.h1Medium30,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'You haven\'t added anything to your cart',
                            style: CustomTextStyle14.h1SemiBold14,
                          ),
                        ],
                      )
                    : ListView.builder(
                        itemCount: myCart.length,
                        itemBuilder: (context, index) {
                          final cartItem = myCart[index];

                          int quantity = cartItem['quantity'];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: ListTile(
                              leading: CircleAvatar(
                                // radius: 24,
                                backgroundImage: NetworkImage(
                                  cartItem['image'],
                                ),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  cartItem['productname'],
                                  style: CustomTextStyle14.h1SemiBold14,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  cartItem['price'],
                                  style: CustomTextStyle14.h1Regular14,
                                ),
                              ),
                              trailing: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      decreasedCartQuantity(index);
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: AppDarkColors.black10,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '-',
                                          style: CustomTextStyle20.h1Bold20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14),
                                    child: Text(quantity.toString()),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      increaseCartQuantity(index);
                                    },
                                    child: CustomIconButton(
                                      color: AppDarkColors.black10,
                                      iconColor: AppDarkColors.black100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
            myCart.isEmpty
                ? const Text('')
                : Padding(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const CheckoutView(),
                                  ));
                                },
                                buttonTextStyle: CustomTextStyle14.h1Medium14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
