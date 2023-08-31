import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Container(
          height: 155,
          width: double.infinity,
          color: AppColors.blue,
        )
      ],
    ));
  }
}
