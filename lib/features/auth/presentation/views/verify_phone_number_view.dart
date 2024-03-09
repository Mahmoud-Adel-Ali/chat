// ignore_for_file: must_be_immutable

import 'package:chat/constant.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_auth_app_bar.dart';
import 'package:chat/features/auth/presentation/views/widgets/verify_phone_number_view_body.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class VerifyPhoneNumberView extends StatelessWidget {
  VerifyPhoneNumberView({super.key});
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: homebackgroundColor,
            child:  CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: CustomAuthAppBar(numOfPage: 2),
                ),
                SliverToBoxAdapter(
                  child: VerifyPhoneNumberViewBody(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

