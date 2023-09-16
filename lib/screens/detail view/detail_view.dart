import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

import '../../widgets/custom button/custom_button.dart';

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
                              Container(
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
                                      final String image =
                                          detailPage['category'];
                                      final String image2 =
                                          detailPage['category'];
                                      final String image3 =
                                          detailPage['category'];
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(180),
                                        child: Container(
                                          height: 245,
                                          width: 245,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Image.network(
                                            activePage == 0
                                                ? image
                                                : activePage == 1
                                                    ? image2
                                                    : image3,
                                            fit: BoxFit.fill,
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
                        Icon(
                          Icons.favorite,
                          color: AppDarkColors.black60,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 25),
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
                        const EdgeInsets.only(left: 25, right: 25, bottom: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            buttonText: 'Add to Cart',
                            onPressed: () {},
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
                            onPressed: () {},
                            buttonTextStyle: CustomTextStyle14.h1Medium14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                    child: Text(
                      'Details',
                      style: CustomTextStyle16.h1Medium16,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 30),
                    child: Text(
                      detailPage['description'],
                      style: CustomTextColor16.h1Regular16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 10, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nutritional facts',
                          style: CustomTextStyle16.h1Medium16,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 35,
                          color: AppDarkColors.black45,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reviews',
                          style: CustomTextStyle16.h1Medium16,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 35,
                          color: AppDarkColors.black45,
                        ),
                      ],
                    ),
                  ),
                ]);
          },
        ),
      ),
    );
  }
}
