import 'package:chat/constant.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_auth_app_bar.dart';
import 'package:chat/features/auth/presentation/views/widgets/verify_phone_number_view_body.dart';
import 'package:flutter/material.dart';

class VerifyPhoneNumberView extends StatelessWidget {
  const VerifyPhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
