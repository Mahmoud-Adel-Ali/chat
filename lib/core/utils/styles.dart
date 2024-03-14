import 'package:chat/constant.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static const TextStyle textstyle45 = TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w500,
      letterSpacing: 2,
      fontFamily: "chat");
  static const textFormTextStyle = TextStyle(
    fontSize: 30,
  );
  static const TextStyle textstyle27 = TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.w800,
    color: kPrimeColor,
  );
  static const TextStyle textstyle25 = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w800,
    color: Colors.black,
  );
  static const TextStyle textstyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.grey,
  );
  static const TextStyle messageStyle = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
}
