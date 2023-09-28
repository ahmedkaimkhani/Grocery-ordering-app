import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_order_app_flutter/screens/login&signup/widgets/custom_textformfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Container(
            height: 200,
            width: 200,
            child: SvgPicture.asset('assets/images/logo.svg'),
          ),
          CustomTextFormField()
        ],
      ),
    ));
  }
}
