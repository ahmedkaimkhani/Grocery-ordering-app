import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';

class GetStartedView extends StatefulWidget {
  GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  int activePage = 0;

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 20),
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
                      Column(
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
                      Column(
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
                    ],
                  ),
                ),
              ),
              Row(
                children: List.generate(
                    2,
                    (index) => Padding(
                          padding: const EdgeInsets.all(3),
                          child: Container(
                            height: activePage == index ? 7 : 10,
                            width: activePage == index ? 25 : 45,
                            decoration: BoxDecoration(
                                color: activePage == index
                                    ? AppDarkColors.black1
                                    : AppDarkColors.black45,
                                borderRadius: BorderRadius.circular(2)),
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
