// ignore_for_file: must_be_immutable

import 'package:chat/constant.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_auth_app_bar.dart';
import 'package:chat/features/auth/presentation/views/widgets/phone_view_body.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PhoneView extends StatelessWidget {
    PhoneView({super.key});
  bool isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: homebackgroundColor,
            child: const Column(
              children: [
                CustomAuthAppBar(
                  numOfPage: 1,
                ),
                PhoneViewBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
