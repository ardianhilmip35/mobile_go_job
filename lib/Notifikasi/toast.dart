import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  void _showToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
  }

  get showToast => _showToast;
}