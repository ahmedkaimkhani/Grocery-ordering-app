import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

import '../../constants/app_colors.dart';

class CustomReviews extends StatelessWidget {
  final String name;
  final String subtitle;
  final String trailing;
  const CustomReviews(
      {super.key,
      required this.name,
      required this.subtitle,
      required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppDarkColors.black1,
          child: Icon(
            Icons.person_2_outlined,
            size: 20,
            color: AppDarkColors.black100,
          ),
        ),
        title: Text(name),
        subtitle: Text(subtitle),
        trailing: Text(
          trailing,
          style: CustomTextStyle12.h1Medium12,
        ),
      ),
    );
  }
}
