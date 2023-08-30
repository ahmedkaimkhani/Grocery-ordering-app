import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/custom_textstyle.dart';
import '../../../constants/string.dart';

customAppBar() {
  AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    title: Padding(
      padding: const EdgeInsets.only(left: 8, top: 12),
      child: Text(
        AppText.appBarText,
        style: CustomTextStyle22.h1SemiBold22,
      ),
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 20, top: 12),
        child: Icon(FontAwesomeIcons.cartShopping),
      ),
    ],
  );
}
