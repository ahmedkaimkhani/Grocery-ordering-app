import 'package:firebase_auth/firebase_auth.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  String? validateContact(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

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

  signUp() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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
                          controller: nameController,
                          title: 'Name',
                          icon: Icons.person_2_outlined,
                          validator: validateName),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          controller: contactController,
                          title: 'Contact',
                          icon: Icons.call_outlined,
                          validator: validateContact),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          controller: emailController,
                          title: 'Email',
                          icon: Icons.alternate_email_outlined,
                          validator: validateEmail),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          controller: passwordController,
                          title: 'Password',
                          icon: Icons.lock_outline_rounded,
                          validator: validatePassword),
                    ],
                  )),
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
                    if (_formKey.currentState!.validate()) {
                      debugPrint('Form is valid');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GetStartedView(),
                          ));
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
