import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomWhiteAppBar(
            title: 'Profile',
          ),
          const SizedBox(
            height: 20,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/tea.jpg',
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: AppDarkColors.black1,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Ahmed Raza',
            style: CustomTextStyle20.h1Bold20,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Email:',
                  style: CustomTextStyle18.h1Bold318,
                ),
                Text(
                  'ahmed@gmail.com',
                  style: CustomTextColor16.h1SemiBold16,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Divider(),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phone No:',
                  style: CustomTextStyle18.h1Bold318,
                ),
                Text(
                  '0315-2116095',
                  style: CustomTextColor16.h1SemiBold16,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
