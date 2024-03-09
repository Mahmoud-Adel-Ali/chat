import 'package:chat/constant.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:chat/features/auth/data/cubit/phone_verify_cubit.dart';
import 'package:chat/features/auth/presentation/views/widgets/verification_code_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyPhoneNumberViewBody extends StatelessWidget {
  VerifyPhoneNumberViewBody({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final authBlockProvider = BlocProvider.of<PhoneVerifyCubit>(context);

    return Column(
      children: [
        const SizedBox(height: 130),
        const Text("Enter the code that was send to ",
            style: Styles.textstyle27),
        Text(
          authBlockProvider.phoneNum.toString(),
          style: Styles.textstyle27.copyWith(
            color: kthirdAuthPage,
          ),
        ),
        const SizedBox(height: 130),
        VerificationCodeSection(
          phoneNum: authBlockProvider.phoneNum.toString(),
        ),
      ],
    );
  }
}
