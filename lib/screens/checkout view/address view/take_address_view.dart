import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

import '../../../widgets/custom button/custom_button.dart';
import '../../../widgets/custom_appbar.dart';
import '../checkout_view.dart';
import '../widgets/custom_textfield.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 60,
            ),
            const CustomWhiteAppBar(title: 'Address'),
            const CustomTextField(
              textName: 'Home',
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomTextField(
              textName: 'Office',
              hintText: 'Office Address',
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: width * 0.90,
                child: CustomButton(
                  buttonText: 'Save',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CheckoutView(),
                    ));
                  },
                  buttonTextStyle: CustomTextStyle14.h1Medium14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Padding(
//             padding: const EdgeInsets.all(25),
//             child: Text(
//               'Delivery Address',
//               style: CustomTextColor16.h1RegularBlack,
//             ),
//           ),
