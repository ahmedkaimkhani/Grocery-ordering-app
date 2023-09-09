import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/screens/cart%20item/cart.list.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/widgets/custom%20add%20button/custom_add_icon.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int itemQuantity = 1;

  increaseItem() {
    setState(() {
      itemQuantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomWhiteAppBar(
            title: 'Shopping Cart (${myCart.length})',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: ListView.builder(
                itemCount: myCart.length,
                itemBuilder: (context, index) {
                  final cartItem = myCart[index];
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
                      trailing: SizedBox(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
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
                            Text(itemQuantity.toString()),
                            InkWell(
                              onTap: () {
                                increaseItem();
                              },
                              child: CustomIconButton(
                                color: AppDarkColors.black10,
                                iconColor: AppDarkColors.black100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
