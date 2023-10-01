import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

class CustomGridViewItem extends StatefulWidget {
  final String? image;
  final String? price;
  final String? productName;
  final itemLenght;
  final List<Map<String, dynamic>> foundProduct;
  const CustomGridViewItem(
      {super.key,
      this.image,
      this.price,
      this.productName,
      this.itemLenght,
      required this.foundProduct});

  @override
  State<CustomGridViewItem> createState() => _CustomGridViewItemState();
}

class _CustomGridViewItemState extends State<CustomGridViewItem> {
  @override
  Widget build(BuildContext context) {
    return widget.foundProduct.isNotEmpty
        ? GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 210,
            ),
            itemCount: widget.foundProduct.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: Center(
                        child: Stack(children: [
                          Image.network(
                            widget.image ??
                                '${widget.foundProduct.elementAt(index)['image']}',
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 6,
                            right: 6,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: AppColors.blue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                  color: AppDarkColors.black1,
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8, left: 6, right: 6, bottom: 6),
                      child: Text(
                        widget.price ??
                            '${widget.foundProduct.elementAt(index)['price']}',
                        style: CustomTextStyle18.h1Bold318,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: Text(
                        widget.productName ??
                            '${widget.foundProduct.elementAt(index)['name']}',
                        style: CustomTextStyle14.h1Regular14,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : Column(
            children: [
              Image.asset(
                'assets/images/search.gif',
                height: 200,
                width: 200,
              ),
              Align(
                child: Text(
                  'Results not found please try with different search',
                  style: CustomTextStyle14.h1SemiBold14,
                ),
              ),
            ],
          );
  }
}
