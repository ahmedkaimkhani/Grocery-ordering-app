import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomWhiteAppBar(
              title: 'Orders',
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    child: Text('Orders'),
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    child: Text('Past'),
                    decoration: BoxDecoration(
                        color: AppDarkColors.black20,
                        borderRadius: BorderRadius.circular(60)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
