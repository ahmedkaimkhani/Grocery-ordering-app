import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String name) {
  final snackBar = SnackBar(
    content: Text(name),
    duration: Duration(seconds: 1),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
