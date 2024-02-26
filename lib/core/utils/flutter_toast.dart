import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

showFlutterToast({required String msg}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green[800],
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
