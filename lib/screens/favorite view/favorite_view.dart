import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/screens/favorite%20view/favorite_list.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_textstyle.dart';
import '../../constants/string.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 155,
            width: double.infinity,
            color: AppColors.blue,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppText.favorite,
                    style: CustomTextStyle30.h1Bold30,
                  ),
                  Text(
                    AppText.favProducts,
                    style: CustomTextStyle45.h1Bold50,
                  )
                ],
              ),
            )),
        ListView.builder(
          itemCount: favItem.length,
          itemBuilder: (context, index) {
            return const ListTile();
          },
        )
      ],
    );
  }
}
