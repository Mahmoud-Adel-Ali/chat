

import 'package:chat/constant.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key, required this.onChanged,
  });
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      maxLength: 11,
      decoration: InputDecoration(
        hintText: "0000 0000 000",
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
