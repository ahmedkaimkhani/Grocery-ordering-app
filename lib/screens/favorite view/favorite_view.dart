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
        const SizedBox(
          height: 20,
        ),
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
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      mainAxisExtent: 210,
                    ),
                    itemCount: favItem.length,
                    itemBuilder: (context, index) {
                      final myFavItem = favItem[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: AppDarkColors.black10,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    myFavItem['image'],
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 6, right: 6, bottom: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${myFavItem['price']}',
                                    style: CustomTextStyle18.h1Bold318,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          favItem.removeAt(index);
                                        });
                                        // detail['isFav'] = false;
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        color: myFavItem['isFav'] == true
                                            ? AppColors.red
                                            : AppDarkColors.black20,
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              child: Text(
                                myFavItem['productname'],
                                style: CustomTextStyle14.h1Regular14,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        )
      ],
    );
  }
}

// final listData = data[index];
//                     final shops = listData['shops'][index];
//                     final shopProducts = shops['product'][index];
//                     final detail = shopProducts['detail'][index];



// ListView.builder(
//                   itemCount: favItem.length,
//                   itemBuilder: (context, index) {
//                     final myFavItem = favItem[index];

//                     return ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: NetworkImage(myFavItem['image']),
//                       ),
//                       title: Text(myFavItem['productname']),
//                       subtitle: Text('\$${myFavItem['price']}'),
//                       trailing: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               favItem.removeAt(index);
//                             });
//                             // detail['isFav'] = false;
//                           },
//                           icon: Icon(
//                             Icons.favorite,
//                             color: myFavItem['isFav'] == true
//                                 ? AppColors.red
//                                 : AppDarkColors.black20,
//                           )),
//                     );
//                   },
//                 ),
//         )
//       ],
//     );
//   }
// }