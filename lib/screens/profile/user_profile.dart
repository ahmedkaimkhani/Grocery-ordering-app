import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? userId;
  String? userName;
  String? userEmail;
  String? userContactNo;
  bool isLoading = true;

  Future<void> fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      setState(() {
        userId = user.uid;
        userEmail = user.email;
      });

      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userSnapshot.exists) {
        setState(() {
          userName = userSnapshot['name'];
          userContactNo = userSnapshot['contact'];
        });
      }
    }
    print('userName: $userName');
    print('userContactNo: $userContactNo');

    setState(() {
      isLoading =
          false; // Set loading to false after data is fetched (or simulated delay)
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

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
          if (isLoading)
            CircularProgressIndicator()
          else
            Text(
              userName ?? '',
              style: CustomTextColor16.h1SemiBold16,
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
                if (isLoading)
                  CircularProgressIndicator()
                else
                  Text(
                    userEmail ?? '',
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
                if (isLoading)
                  CircularProgressIndicator()
                else
                  Text(
                    userContactNo ?? '',
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
