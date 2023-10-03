import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/screens/login&signup/login_view.dart';
import 'package:grocery_order_app_flutter/screens/login&signup/utils/utils.dart';
import 'package:grocery_order_app_flutter/screens/orders/order_view.dart';
import 'package:grocery_order_app_flutter/screens/profile/widget/custom_menu.dart';

import 'user_profile.dart';

class ProfileMenu extends StatelessWidget {
  ProfileMenu({super.key});

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserProfile(),
                  ));
            },
            child: const CustomMenu(
              title: 'Profile',
              icon: Icons.person_2_outlined,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderView(),
                  ));
            },
            child: const CustomMenu(
              title: 'My Orders',
              icon: Icons.person_2_outlined,
            ),
          ),
          const CustomMenu(
            title: 'Vouchers',
            icon: Icons.card_giftcard_outlined,
          ),
          const CustomMenu(
            title: 'Help',
            icon: Icons.help_outline,
          ),
          GestureDetector(
            onTap: () {
              auth.signOut().then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ));
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },
            child: const CustomMenu(
              title: 'Log out',
              icon: Icons.logout_outlined,
            ),
          )
        ],
      ),
    );
  }
}
