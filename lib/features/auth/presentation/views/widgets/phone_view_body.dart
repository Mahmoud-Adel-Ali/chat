import 'package:chat/constant.dart';
import 'package:chat/core/utils/app_router.dart';
import 'package:chat/core/utils/flutter_toast.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:chat/features/auth/data/cubit/phone_verify_cubit.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_buttom.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PhoneViewBody extends StatelessWidget {
  PhoneViewBody({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final authBlockProvider = BlocProvider.of<PhoneVerifyCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: formKey,
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
              onChanged: (data) {
                authBlockProvider.phoneNum = "+2$data";
              },
              keyboardType: TextInputType.number,
              validator: (data) {
                print("=====data=========$data==========data====");
                if (data!.isEmpty) {
                  return 'required';
                } else if (!isEgyptPhoneNum(data)) {
                  return "Please complete mobile number";
                } else {
                  return null;
                }
              },
              hinttext: '01234567890',
            ),
            const SizedBox(height: 50),
            CustomButton(
              text: 'Next',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  showFlutterToast(msg: "get code that was sent to you phone");
                  GoRouter.of(context).push(AppRouter.verfiyPhoneNumberView);
                } else {
                  showFlutterToast(msg: "required");
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  bool isEgyptPhoneNum(String? data) {
    if (data!.length < 3) return false;
    bool len = data.length == 11;
    bool third =
        data[2] == '0' || data[2] == '1' || data[2] == '2' || data[2] == '5';
    return (len && data[0] == '0' && data[1] == '1' && third);
  }
}
