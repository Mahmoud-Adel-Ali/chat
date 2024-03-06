import 'package:chat/core/utils/app_router.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:go_router/go_router.dart';

class VerificationCodeSection extends StatefulWidget {
  const VerificationCodeSection({super.key});

  @override
  State<VerificationCodeSection> createState() =>
      _VerificationCodeSectionState();
}

class _VerificationCodeSectionState extends State<VerificationCodeSection> {
  String code = '';
  bool onEditing = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerificationCode(
          fillColor: Colors.grey[300],
          textStyle: const TextStyle(fontSize: 21.0, color: Color(0xff0074e0)),
          underlineColor: const Color(0xff0074e0),
          keyboardType: TextInputType.number,
          length: 6,
          // clearAll is NOT required, you can delete it
          // takes any widget, so you can implement your design
          onCompleted: (String value) {
            setState(() {
              code = value;
            });
          },
          onEditing: (bool value) {
            setState(() {
              onEditing = value;
            });
          },
        ),
        const SizedBox(height: 70),
        CustomButton(
          text: "Continue",
          onTap: () {
            GoRouter.of(context).go(AppRouter.continueView);
          },
        ),
      ],
    );
  }
}
