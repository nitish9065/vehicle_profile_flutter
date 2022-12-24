import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

showToast(String msg, Color colors) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colors,
      textColor: Colors.white,
      fontSize: 16.0);
}
