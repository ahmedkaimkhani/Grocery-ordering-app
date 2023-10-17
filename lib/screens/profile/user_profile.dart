import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  User? user;
  late String userName = '';
  late String userEmail = '';
  late String userContactNo = '';

  final FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> fetchUserData() async {
    final User? currentUser = auth.currentUser;
    if (currentUser != null) {
      final userData = await users.doc(currentUser.uid).get();

      setState(() {
        user = currentUser;
        userName = userData['name'];
        userEmail = userData['email'];
        userContactNo = userData['contact'];
      });
      saveUserDataLocally(userName, userEmail, userContactNo);
    }
  }

  Future<void> saveUserDataLocally(
      String userName, String userEmail, String userContactNo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userName);
    await prefs.setString('userEmail', userEmail);
    await prefs.setString('userContactNo', userContactNo);
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
                height: 150,
                width: 150,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/ahmed.jpg',
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
                      color: Colors.black, //AppColors.blue,
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
            userName,
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
                  userEmail,
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
                  userContactNo,
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



// storeData() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     await prefs.setString('user', user as String);
//     setState(() {});
//   }

//   getStoreData() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     prefs.get('user');
//     setState(() {});
//   }

//   fetchStoreData() async {
//     await getStoreData();
//   }