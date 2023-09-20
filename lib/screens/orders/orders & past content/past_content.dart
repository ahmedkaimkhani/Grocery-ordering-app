import 'package:flutter/material.dart';

class PastContent extends StatelessWidget {
  const PastContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://w7.pngwing.com/pngs/1018/975/png-transparent-juice-banana-food-auglis-flavor-banana-natural-foods-leaf-orange-thumbnail.png'),
                  ),
                  title: Text('Bananas'),
                  subtitle: Text('\$55.50'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('20/082023'),
                    TextButton(onPressed: () {}, child: Text('Success'))
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
