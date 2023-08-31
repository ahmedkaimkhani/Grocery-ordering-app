import 'package:flutter/material.dart';

import '../../../list item data/deals_fruit_tea.dart';

class DealsItem extends StatelessWidget {
  const DealsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 270,
      ),
      itemCount: dealItems.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: Image.network(
                  '${dealItems.elementAt(index)['image']}',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Text('${dealItems.elementAt(index)['price']}'),
              Text('${dealItems.elementAt(index)['name']}'),
            ],
          ),
        );
      },
    );
  }
}
