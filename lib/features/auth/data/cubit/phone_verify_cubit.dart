import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:chat/core/utils/app_router.dart';
import 'package:chat/core/utils/flutter_awesome_dialog.dart';
import 'package:chat/features/auth/data/cubit/phone_verify_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class PhoneVerifyCubit extends Cubit<PhoneVerifyState> {
  PhoneVerifyCubit() : super(PhoneVerifyInitial());
  late String verificationId;
  late String smsCode;
  verifyPhoneNumberInPhoneView({required context}) async {
    emit(PhoneLoading());
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: "phoneNumber",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        emit(PhoneLSuccess());
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          awesomeDialog(
              context: context,
              dialogType: DialogType.error,
              title: "invalid-phone-number",
              desc: 'The provided phone number is not valid.');
        }
        emit(PhoneFailure());
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = 'xxxx';
        GoRouter.of(context).push(AppRouter.verfiyPhoneNumberView);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(minutes: 1),
    );
  }

  verificationPhoneNumInVrifyView({required context}) async {
    emit(VerifyLoading());
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
    } catch (e) {
      awesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: "error in verification code",
          desc: e.toString());
    }
    if (auth.currentUser != null) {
      GoRouter.of(context).go(AppRouter.homeView);
    }
  }
}
