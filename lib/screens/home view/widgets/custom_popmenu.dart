import 'package:flutter/material.dart';

class CustomPopMenu extends StatelessWidget {
  final String? text;
  final String? text2;
  final String? text3;
  const CustomPopMenu({super.key, this.text, this.text2, this.text3});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {},
      color: const Color(0xff1F2C34),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 1,
          child: Text('Karachi'),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text('Lahore'),
        ),
        const PopupMenuItem(
          value: 3,
          child: Text('Islamabad'),
        ),
      ],
    );
  }
}
