import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

import '../../../list item data/deals_fruit_tea.dart';

class CustomGridViewItem extends StatelessWidget {
  const CustomGridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 210,
      ),
      itemCount: dealItems.length,
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
                      '${dealItems.elementAt(index)['image']}',
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
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 18,
                            color: AppDarkColors.black1,
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 6),
                child: Text(
                  '${dealItems.elementAt(index)['price']}',
                  style: CustomTextStyle18.h1Bold318,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: Text(
                  '${dealItems.elementAt(index)['name']}',
                  style: CustomTextStyle14.h1Regular14,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
