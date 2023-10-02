import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';
import 'package:grocery_order_app_flutter/constants/custom_textstyle.dart';
import 'package:grocery_order_app_flutter/screens/get%20started%20view/get_started_1.dart';
import 'package:grocery_order_app_flutter/screens/login&signup/signup_view.dart';
import 'package:grocery_order_app_flutter/screens/login&signup/utils/utils.dart';
import 'package:grocery_order_app_flutter/screens/login&signup/widgets/custom_textformfield.dart';
import 'package:grocery_order_app_flutter/widgets/custom%20button/custom_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 character long';
    }
    return null;
  }

  login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Utils().toastMessage('Login Successful');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils().toastMessage('User not exist: ${e.message}');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Utils().toastMessage('Wrong password: ${e.message}');
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      title: 'Email',
                      validator: validateEmail,
                      controller: emailController,
                      icon: Icons.alternate_email_outlined,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      title: 'Password',
                      validator: validatePassword,
                      controller: passwordController,
                      icon: Icons.lock_outline_rounded,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  buttonText: 'LOG IN',
                  buttonColor: AppColors.blue,
                  buttonTextStyle: CustomTextStyle14.h1Medium14,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      login();
                      debugPrint('Form is valid');
                    } else {
                      debugPrint('Form is invalid');
                    }
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
                    'Don\'t have an account?',
                    style:
                        TextStyle(fontSize: 18, color: AppDarkColors.black100),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpView(),
                          ));
                    },
                    child: Text(
                      ' Sign Up',
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
