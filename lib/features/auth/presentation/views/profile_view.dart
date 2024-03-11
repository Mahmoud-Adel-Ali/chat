import 'package:chat/constant.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:chat/features/auth/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: homebackgroundColor,
        appBar: AppBar(
          primary: false,
          title: Text(
            "Fill Your Profile",
            style: Styles.textstyle27.copyWith(color: Colors.white),
          ),
          backgroundColor: kPrimeColor,
        ),
        body: const ProfileViewBody(),
      ),
    );
  }
}
