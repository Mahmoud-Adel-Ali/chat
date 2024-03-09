import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat/core/utils/app_router.dart';
import 'package:chat/core/utils/flutter_awesome_dialog.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_buttom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:go_router/go_router.dart';

class VerificationCodeSection extends StatefulWidget {
  const VerificationCodeSection({super.key, required this.phoneNum});
  final String phoneNum;
  @override
  State<VerificationCodeSection> createState() =>
      _VerificationCodeSectionState();
}

class _VerificationCodeSectionState extends State<VerificationCodeSection> {
  String code = '';
  bool onEditing = true;
  late String verifyId;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    authPhone();
    super.initState();
  }

  void authPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phoneNum,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        verifyId = verificationId;
      },
      timeout: const Duration(minutes: 1),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void sendCode() async {
    try {
      String smsCode = code;

      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verifyId, smsCode: smsCode);

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential).then((value) {
        if (value.user != null) {
          GoRouter.of(context).go(AppRouter.continueView);
        }
      });
    } catch (e) {
      awesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: "ERROR",
          desc: e.toString());
    }
  }

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
            sendCode();
          },
        ),
      ],
    );
  }
}
