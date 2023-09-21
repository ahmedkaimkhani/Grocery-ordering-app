import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/screens/categories%20view/model/shops_products.dart';
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
        Expanded(
          child: favItem.isEmpty
              ? Column(
                  children: [
                    Image.network(
                        'https://i.giphy.com/media/0HhDnlH89djZtRqYoO/giphy.webp'),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'You haven\'t added item to your favorite list',
                        style: CustomTextStyle14.h1SemiBold14,
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  itemCount: favItem.length,
                  itemBuilder: (context, index) {
                    final myFavItem = favItem[index];
                    final listData = data[index];
                    final shops = listData['shops'][index];
                    final shopProducts = shops['product'][index];
                    final detail = shopProducts['detail'][index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(myFavItem['image']),
                      ),
                      title: Text(myFavItem['productname']),
                      subtitle: Text('\$${myFavItem['price']}'),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              favItem.removeAt(index);
                            });
                            detail['isFav'] = false;
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: myFavItem['isFav'] == true
                                ? AppColors.red
                                : AppDarkColors.black20,
                          )),
                    );
                  },
                ),
        )
      ],
    );
  }
}
