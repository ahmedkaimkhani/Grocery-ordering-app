import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_order_app_flutter/constants/app_colors.dart';

class Utils {
  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: AppDarkColors.black1,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }
}
