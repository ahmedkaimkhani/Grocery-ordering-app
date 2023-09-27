import 'package:flutter/material.dart';

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
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppDarkColors.black1,
        child: Icon(
          Icons.person_2_outlined,
          color: AppDarkColors.black100,
        ),
      ),
    );
  }
}
