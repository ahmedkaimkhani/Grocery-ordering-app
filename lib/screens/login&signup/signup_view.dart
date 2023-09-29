import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_order_app_flutter/screens/login&signup/login_view.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_textstyle.dart';
import '../../widgets/custom button/custom_button.dart';
import '../get started view/get_started_1.dart';
import 'widgets/custom_textformfield.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppDarkColors.black1,
        body: SafeArea(
            child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: SvgPicture.asset('assets/images/logo.svg'),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                title: 'Name',
                icon: Icons.person_2_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                title: 'Contact',
                icon: Icons.call_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter contact';
                  }
                  return null;
                },
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
              const SizedBox(
                height: 10,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  buttonText: 'SIGN UP',
                  buttonColor: AppColors.blue,
                  buttonTextStyle: CustomTextStyle14.h1Medium14,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GetStartedView(),
                        ));
                  },
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
                    'Already have an account?',
                    style:
                        TextStyle(fontSize: 18, color: AppDarkColors.black100),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ));
                    },
                    child: Text(
                      ' Log In',
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
