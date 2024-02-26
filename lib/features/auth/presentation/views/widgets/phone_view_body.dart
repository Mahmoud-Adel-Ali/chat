import 'package:chat/constant.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';

class PhoneViewBody extends StatelessWidget {
  const PhoneViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image.asset('assets/img/scholar.png'),
            const SizedBox(height: 50),
            Text(
              "Enter your mobile number",
              style: Styles.textstyle45.copyWith(
                fontSize: 30,
                color: kPrimeColor,
              ),
            ),
            const SizedBox(height: 50),
            CustomTextFormFeild(
              onChanged: (data) {},
            ),
          ],
        ),
      ),
    );
  }
}
