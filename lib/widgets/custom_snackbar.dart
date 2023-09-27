import 'package:flutter/material.dart';

customShowSnackBar({required BuildContext context, required String message}) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: 1),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
