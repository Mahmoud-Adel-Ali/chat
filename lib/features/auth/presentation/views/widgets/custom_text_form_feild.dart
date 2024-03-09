// ignore_for_file: unrelated_type_equality_checks

import 'package:chat/constant.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.onChanged,
    required this.validator,
    required this.hinttext,
    required this.keyboardType,
  });
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  final String hinttext;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 30, color: kPrimeColor),
      decoration: InputDecoration(
        hintFadeDuration: const Duration(seconds: 1),
        hintText: hinttext,
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
