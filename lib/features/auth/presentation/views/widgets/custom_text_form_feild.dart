// ignore_for_file: unrelated_type_equality_checks

import 'package:chat/constant.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.onChanged,
  });
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.length < 11) {
          return "Please complete mobile number";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 30,color: kPrimeColor),
      decoration: InputDecoration(
        hintFadeDuration: const Duration(seconds: 1),
        hintText: "01234567890",
        
        hintStyle: Styles.textFormTextStyle.copyWith(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: kPrimeColor,
            width: 10,
          ),
        ),
      ),
    );
  }
}
