import 'package:chat/constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap,});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50),
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
            color: kPrimeColor, borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
