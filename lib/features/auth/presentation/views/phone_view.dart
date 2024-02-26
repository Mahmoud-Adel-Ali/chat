import 'package:chat/constant.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_auth_app_bar.dart';
import 'package:chat/features/auth/presentation/views/widgets/phone_view_body.dart';
import 'package:flutter/material.dart';

class PhoneView extends StatelessWidget {
  const PhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: homebackgroundColor,
          child:const Column(
            children: [
              CustomAuthAppBar(
                numOfPage: 1,
              ),
              PhoneViewBody(),
            ],
          ),
        ),
      ),
    );
  }
}
