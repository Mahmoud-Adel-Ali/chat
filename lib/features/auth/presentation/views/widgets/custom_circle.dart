

import 'package:chat/constant.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({
    super.key,
    required this.isComplete,
    required this.childNumber,
  });
  final bool isComplete;
  final int childNumber;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 27,
      child: isComplete
          ? const Icon(
              Icons.check,
              size: 50,
              color: Colors.green,
            )
          : Text(
              childNumber.toString(),
              style: Styles.textstyle45.copyWith(
                color: kPrimeColor,
                fontSize: 30,
              ),
            ),
    );
  }
}
