import 'package:chat/constant.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:flutter/material.dart';



class WelcomeContainer extends StatelessWidget {
  const WelcomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 2,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kPrimeColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(400, 40),
          bottomRight: Radius.elliptical(400, 40),
        ),
      ),
      alignment: Alignment.center,
      child: const Text(
        "WELCOME",
        style: Styles.textstyle45,
      ),
    );
  }
}
