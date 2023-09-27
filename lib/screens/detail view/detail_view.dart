import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/screens/cart%20item/cart.list.dart';
import 'package:grocery_order_app_flutter/screens/cart%20item/cart_view.dart';
import 'package:grocery_order_app_flutter/screens/favorite%20view/favorite_list.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../widgets/custom button/custom_button.dart';
import '../../widgets/custom_alertdialog.dart';
import '../../widgets/custom_snackbar.dart';

class DetailView extends StatefulWidget {
  final Map<String, dynamic> shopProducts;
  const DetailView({super.key, required this.shopProducts});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  double afterDiscountPrice(detailPage) {
    final double sellingPrice = detailPage['price'] - detailPage['discount'];
    return sellingPrice;
  }

  int activePage = 0;

  final PageController pageController = PageController(
    initialPage: 0,
  );
  // add to cart method
  addToCart(addCartProduct) {
    // if products already exist than..
    if (myCart.contains(addCartProduct)) {
      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog(message: 'Item is already added in cart...');
        },
      );
    } else {
      myCart.add(addCartProduct);
      customShowSnackBar(context: context, message: 'Item added to cart');
    }
    setState(() {});
  }

  // add to favorite method
  addToFavorite(detailPage) {
    if (detailPage['isFav'] == false) {
      favItem.add(detailPage);
      // snackbar method
      customShowSnackBar(
          context: context, message: 'Item is add into favorite list');
      detailPage['isFav'] = true;
    } else {
      favItem.remove(detailPage);
      // snackbar method
      customShowSnackBar(
          context: context, message: 'Item is removed from favorite list');
      detailPage['isFav'] = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          // itemCount: widget.shopProducts['detail'].length,
          itemCount: 1,
          itemBuilder: (context, index) {
            final detailPage = widget.shopProducts['detail'][index];
            final addCartProduct = widget.shopProducts;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      const CustomWhiteAppBar(
                        iconCart: Icons.shopping_bag_outlined,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 245,
                                  width: 245,
                                  child: PageView.builder(
                                    onPageChanged: (index) {
                                      setState(() {
                                        activePage = index;
                                      });
                                    },
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      final String image = detailPage['image'];
                                      final String image2 =
                                          detailPage['image2'];
                                      final String image3 =
                                          detailPage['image3'];
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(180),
                                        child: Container(
                                          height: 245,
                                          width: 245,
                                          decoration: BoxDecoration(
                                              color: AppDarkColors.black1,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Hero(
                                            transitionOnUserGestures: true,
                                            tag: widget.shopProducts,
                                            child: Image.network(
                                              activePage == 0
                                                  ? image
                                                  : activePage == 1
                                                      ? image2
                                                      : image3,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  height: activePage == index ? 6 : 4,
                                  width: activePage == index ? 30 : 20,
                                  decoration: BoxDecoration(
                                      color: activePage == index
                                          ? AppColors.orange
                                          : AppDarkColors.black20,
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                              )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 10, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detailPage['category'],
                              style: CustomTextStyle20.h1Bold20,
                            ),
                            Text(
                              detailPage['productname'],
                              style: CustomTextStyle20.h1Bold20,
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              addToFavorite(detailPage);
                              print(favItem.length);
                            },
                            icon: const Icon(Icons.favorite),
                            color: detailPage['isFav'] == false
                                ? AppDarkColors.black20
                                : AppColors.red)
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${afterDiscountPrice(detailPage)}',
                          style: CustomTextStyle14.h1Regular14,
                        ),
                        Container(
                          width: 80,
                          decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Center(
                              child: Text(
                                '\$${detailPage['discount']} OFF',
                                style: CustomTextStyle12.h1Regular12White,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Reg: \$${detailPage['price'].toStringAsFixed(2)}',
                          style: CustomTextStyle12.h1Medium12,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                    child: Row(
                      children: [
                        RatingBar.builder(
                          itemSize: 20,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '110 Reviews',
                          style: CustomTextStyle14.h1Medium14Grey,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            buttonText: 'Add to Cart',
                            onPressed: () {
                              addToCart(addCartProduct);
                            },
                            buttonColor: AppDarkColors.black1,
                            borderColor: AppColors.blue,
                            buttonTextStyle:
                                CustomTextStyle14.h1SemiBold14CBlue,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomButton(
                            buttonText: 'Buy Now',
                            onPressed: () async {
                              await Navigator.of(context)
                                  .push(MaterialPageRoute(
                                builder: (context) => const CartView(),
                              ));
                              setState(() {});
                            },
                            buttonTextStyle: CustomTextStyle14.h1Medium14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ExpansionTile(
                      collapsedIconColor: AppDarkColors.black45,
                      iconColor: AppDarkColors.black100,
                      title: Text(
                        'Details',
                        style: CustomTextStyle16.h1Medium16,
                      ),
                      childrenPadding: const EdgeInsets.only(
                          left: 18, right: 18, bottom: 18),
                      children: [
                        Text(
                          detailPage['description'],
                          style: CustomTextColor16.h1Regular16,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ExpansionTile(
                      collapsedIconColor: AppDarkColors.black45,
                      iconColor: AppDarkColors.black100,
                      title: Text(
                        'Nutritional facts',
                        style: CustomTextStyle16.h1Medium16,
                      ),
                      childrenPadding: const EdgeInsets.only(
                          left: 18, right: 18, bottom: 18),
                      children: [
                        Text(
                          'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                          style: CustomTextColor16.h1Regular16,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ExpansionTile(
                      collapsedIconColor: AppDarkColors.black45,
                      iconColor: AppDarkColors.black100,
                      title: Text(
                        'Reviews',
                        style: CustomTextStyle16.h1Medium16,
                      ),
                    ),
                  ),
                ]);
          },
        ),
      ),
    );
  }
}
