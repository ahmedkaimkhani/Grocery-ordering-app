import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/screens/cart%20item/cart.list.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
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
    final double height = MediaQuery.of(context).size.height;
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
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: ListView.builder(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
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
            Container(
              color: AppDarkColors.black20,
              height: 300,
              width: double.infinity,
              child: SizedBox(
                width: width * 0.90,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal'),
                        Text('\$${calculateSubtotal().toStringAsFixed(2)}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Delivery'),
                        Text('\$2.00'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Total'),
                        Text('\$37.00'),
                      ],
                    ),
                    SizedBox(
                      width: width * 0.90,
                      child: CustomButton(
                        buttonText: 'Proceed To checkout',
                        onPressed: () {},
                        buttonTextStyle: CustomTextStyle14.h1Medium14,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
