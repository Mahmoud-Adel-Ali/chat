import 'package:chat/constant.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({
    super.key,
  
    required this.childNumber,
    required this.pageNumber,
  });
  final int childNumber;
  final int pageNumber;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:
          pageNumber >= childNumber ? Colors.white : Colors.grey[700],
      radius: 27,
      child: pageNumber > childNumber
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
