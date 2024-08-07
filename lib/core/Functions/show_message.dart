import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage({
  required String text,
}) {
  Fluttertoast.showToast(
    msg: text,
    backgroundColor: Colors.grey[400],
    fontSize: 18,
    gravity: ToastGravity.BOTTOM,
    textColor: Colors.blue[900],
    toastLength: Toast.LENGTH_LONG,
  );
}
