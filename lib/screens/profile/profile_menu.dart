import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/screens/profile/widget/custom_menu.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomMenu(
          title: 'Profile',
        )
      ],
    );
  }
}
