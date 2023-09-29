import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/screens/login&signup/widgets/custom_textformfield.dart';
import 'package:grocery_order_app_flutter/widgets/custom%20button/custom_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppDarkColors.black1,
        body: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Container(
              height: 200,
              width: 200,
              child: SvgPicture.asset('assets/images/logo.svg'),
            ),
            CustomTextFormField(
              title: 'Email',
              icon: Icons.alternate_email_outlined,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              title: 'Password',
              icon: Icons.lock_outline_rounded,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.blue,
                    decoration: TextDecoration.underline,
                  ),
                )),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: CustomButton(
                  buttonText: 'LOG IN',
                  buttonColor: AppColors.blue,
                  buttonTextStyle: CustomTextStyle14.h1Medium14,
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(fontSize: 18, color: AppDarkColors.black100),
                ),
                Text(
                  ' Sign Up',
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            )
          ],
        )));
  }
}
