import 'package:chat/constant.dart';
import 'package:chat/core/utils/app_router.dart';
import 'package:chat/core/utils/flutter_toast.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_buttom.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PhoneViewBody extends StatefulWidget {
  const PhoneViewBody({super.key});

  @override
  State<PhoneViewBody> createState() => _PhoneViewBodyState();
}

class _PhoneViewBodyState extends State<PhoneViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
              onChanged: (data) {},
            ),
            const SizedBox(height: 50),
            CustomButton(
              text: 'Next',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  showFlutterToast(msg: "done");
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
}
