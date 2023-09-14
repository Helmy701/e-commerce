import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

customToast({
  bool isError = false,
  required String content,
}) {
  return Fluttertoast.showToast(
    msg: content,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: isError ? Colors.red : Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
