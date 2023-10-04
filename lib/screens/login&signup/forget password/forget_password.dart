import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_textstyle.dart';
import '../../../widgets/custom button/custom_button.dart';
import '../utils/utils.dart';
import '../widgets/custom_textformfield.dart';

class ForgetPassordView extends StatefulWidget {
  const ForgetPassordView({super.key});

  @override
  State<ForgetPassordView> createState() => _ForgetPassordViewState();
}

class _ForgetPassordViewState extends State<ForgetPassordView> {
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  final auth = FirebaseAuth.instance;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  forgetMethod() {
    loading = true;
    auth
        .sendPasswordResetEmail(email: emailController.text.toString())
        .then((value) {
      Utils().toastMessage(
          'we have sent you email to recover password, please check email');
    }).onError((error, stackTrace) {
      loading = false;
      Utils().toastMessage(error.toString());
    });
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
              Center(
                child: Form(
                  key: _formKey,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  loading: loading,
                  buttonText: 'FORGET',
                  buttonColor: AppColors.blue,
                  buttonTextStyle: CustomTextStyle14.h1Medium14,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      forgetMethod();
                    }
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        )));
  }
}
