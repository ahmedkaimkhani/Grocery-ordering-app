import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/custom_textstyle.dart';
import '../../../constants/string.dart';

customAppBar({IconData? iconS}) {
  return AppBar(
    toolbarHeight: 80,
    automaticallyImplyLeading: false,
    elevation: 0.0,
    title: Padding(
      padding: const EdgeInsets.only(left: 8, top: 12),
      child: Text(
        AppText.appBarText,
        style: CustomTextStyle22.h1SemiBold22,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20, top: 12),
        child: Icon(iconS),
      ),
      const Padding(
        padding: EdgeInsets.only(right: 20, top: 12),
        child: Icon(FontAwesomeIcons.cartShopping),
        // child: Image.asset("assets/images/logo.png"),
      ),
    ],
  );
}
