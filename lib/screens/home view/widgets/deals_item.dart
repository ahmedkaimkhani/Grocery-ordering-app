import 'package:flutter/material.dart';

final List<Map<String, dynamic>> dealItems = [
  {
    'price': '\$325',
    'name': 'Orange Package 1 | 1 bundle',
    'image':
        'https://www.wallpaperflare.com/static/583/448/1015/oranges-basket-fruit-leaves-wallpaper.jpg'
  },
  {
    'price': '\$89',
    'name': 'Green Tea Package 2 | 1 bundle',
    'image': 'https://img.lovepik.com/desgin_photo/45003/1444_list.jpg'
  }
];

class DealsItem extends StatelessWidget {
  const DealsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: dealItems.length,
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
    );
  }
}
