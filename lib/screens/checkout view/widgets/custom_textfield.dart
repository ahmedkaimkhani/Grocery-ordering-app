import 'package:flutter/material.dart';

import '../../../constants/custom_textstyle.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? myTextEditingController;
  final String? textName;
  final String? hintText;
  const CustomTextField(
      {super.key, this.myTextEditingController, this.textName, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textName ?? '',
            style: CustomTextStyle12.h1Medium12,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: hintText ?? 'Home Address',
              border: InputBorder.none,
            ),
            style: CustomTextStyle16.h1Medium16,
            controller: myTextEditingController,
          ),
        ],
      ),
    );
  }
}
