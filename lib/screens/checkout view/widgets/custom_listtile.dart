import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_textstyle.dart';
import '../checkout_view.dart';

class CustomListTile extends StatelessWidget {
  final int index;
  const CustomListTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Text(
                      'Home',
                      style: CustomTextStyle14.h1Regular14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Icon(
                      Icons.check_circle,
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    address[index].toString(),
                    style: CustomTextStyle14.h1SemiBold14,
                  ),
                  Text(
                    'Edit',
                    style: CustomTextStyle12.h1Medium12Blue,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
