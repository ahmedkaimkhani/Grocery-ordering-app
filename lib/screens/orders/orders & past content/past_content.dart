import 'package:flutter/material.dart';

class PastContent extends StatelessWidget {
  const PastContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: const [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://w7.pngwing.com/pngs/1018/975/png-transparent-juice-banana-food-auglis-flavor-banana-natural-foods-leaf-orange-thumbnail.png'),
                ),
                title: Text('Bananas'),
                subtitle: Text('\$55.50'),
              )
            ],
          );
        },
      ),
    );
  }
}
