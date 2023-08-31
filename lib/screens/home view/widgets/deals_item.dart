import 'package:flutter/material.dart';

final List<Map<String, dynamic>> dealItems = [
  {
    'price': '\$325',
    'name': 'Orange Package 1 | 1 bundle',
    'image': 'https://www.pexels.com/photo/orange-fruit-161559/'
  },
  {
    'price': '\$89',
    'name': 'Green Tea Package 2 | 1 bundle',
    'image':
        'https://www.freepik.com/premium-vector/tea-ad-background-realistic-green-black-drink-advertisement-with-branded-pyramid-teabags-green-leaves-porcelain-cup-blurred-background-hot-beverage-banner-design-vector-illustration_61087649.htm#query=green%20tea&position=7&from_view=keyword&track=ais'
  }
];

class DealsItem extends StatelessWidget {
  const DealsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.network(
                      '${dealItems.elementAt(index)['image']}',
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
