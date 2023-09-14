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
  TextEditingController editControllerHome = TextEditingController();
  TextEditingController editControllerOffice = TextEditingController();

  addHomeAddress() {
    address.add(editControllerHome.text);
    editControllerHome.clear();
  }

  addOfficeAddress() {
    address.add(editControllerOffice.text);
    editControllerOffice.clear();
  }

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
            CustomTextField(
              textName: 'Home',
              myTextEditingController: editControllerHome,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              textName: 'Office',
              hintText: 'Office Address',
              myTextEditingController: editControllerOffice,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: width * 0.90,
                child: CustomButton(
                  buttonText: 'Save',
                  onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CheckoutView(),
                    ));
                    addHomeAddress();
                    addOfficeAddress();
                    setState(() {});
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
