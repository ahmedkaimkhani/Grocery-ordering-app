import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/screens/get%20started%20view/widget/button.dart';
import 'package:grocery_order_app_flutter/widgets/custom%20button/custom_button.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  int activePage = 0;

  final PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 30),
          child: Column(
            children: [
              Container(
                // color: Colors.red,
                child: SizedBox(
                  height: height * 0.35,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        activePage = index;
                      });
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35, right: 35),
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                'Your holiday shopping delivered to Screen one',
                                style: CustomTextStyle30.h1Bold30,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'There\'s something for everyone to enjoy with Sweet Shop Favourites Screen 1',
                                style: CustomTextStyle18.h1Medium18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35, right: 35),
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                'Your holiday shopping delivered to Screen two',
                                style: CustomTextStyle30.h1Bold30,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'There\'s something for everyone to enjoy with Sweet Shop Favourites Screen 2',
                                style: CustomTextStyle18.h1Medium18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Row(
                  children: List.generate(
                      2,
                      (index) => Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: activePage == index ? 7 : 5,
                              width: activePage == index ? 45 : 25,
                              decoration: BoxDecoration(
                                  color: activePage == index
                                      ? AppDarkColors.black1
                                      : AppDarkColors.black45,
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                          )),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  child: const Image(
                    image: NetworkImage(
                      'https://scontent.fkhi23-1.fna.fbcdn.net/v/t39.30808-6/373679846_807691067720543_3926578182426451910_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=49d041&_nc_eui2=AeEwQfHSP-L9ssw46rYKDul0haxrkhh4n3GFrGuSGHifcbp5OoGGUsjUVHym2QXbRYcpGAVhVepNdHAzawiqeZGP&_nc_ohc=efBLYz6yhNkAX9znd1x&_nc_ht=scontent.fkhi23-1.fna&oh=00_AfBm-JtzTTYpNYDcxK5ixFJRhEq65dJmJo7FO1muqkJQPw&oe=64F512BC',
                    ),
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                height: height * 0.08,
                width: width * 0.65,
                child: const Custom1stButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
