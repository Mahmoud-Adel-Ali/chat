// ignore_for_file: must_be_immutable

import 'package:chat/constant.dart';
import 'package:chat/features/auth/data/cubit/phone_verify_cubit.dart';
import 'package:chat/features/auth/data/cubit/phone_verify_state.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_auth_app_bar.dart';
import 'package:chat/features/auth/presentation/views/widgets/phone_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneView extends StatelessWidget {
  const PhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneVerifyCubit, PhoneVerifyState>(
      listener: (context, state) {},
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: homebackgroundColor,
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: CustomAuthAppBar(numOfPage: 1),
                ),
                SliverToBoxAdapter(
                  child: PhoneViewBody(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
