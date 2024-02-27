import 'package:chat/constant.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_verification_code_feild.dart';
import 'package:flutter/material.dart';

class VerifyPhoneNumberViewBody extends StatelessWidget {
  const VerifyPhoneNumberViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 130),
        const Text("Enter the code that was send to ",
            style: Styles.textstyle27),
        Text(
          "0123456789",
          style: Styles.textstyle27.copyWith(
            color: kthirdAuthPage,
          ),
        ),
        const SizedBox(height: 130),
        const CustomVerificationCodeFeild(),
      ],
    );
  }
}
