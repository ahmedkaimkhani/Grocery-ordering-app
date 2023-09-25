import 'package:flutter/material.dart';

class CustomPopMenu extends StatelessWidget {
  final String text;
  final String text2;
  final String text3;
  const CustomPopMenu(
      {super.key,
      required this.text,
      required this.text2,
      required this.text3});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {},
      color: const Color(0xff1F2C34),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text(text),
        ),
        PopupMenuItem(
          value: 2,
          child: Text(text2),
        ),
        PopupMenuItem(
          value: 3,
          child: Text(text3),
        ),
      ],
    );
  }
}
