import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

import '../checkout view/widgets/custom_textfield.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              children: const [
                Expanded(
                  child: CustomTextField(
                    textName: 'Exp Date',
                    hintText: 'Exp Date',
                  ),
                ),
                SizedBox(
                  width: 15,
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
        ],
      ),
    );
  }
}
