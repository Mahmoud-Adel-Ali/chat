import 'package:chat/constant.dart';
import 'package:chat/features/auth/presentation/views/widgets/continue_view_body.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_auth_app_bar.dart';
import 'package:flutter/material.dart';

class ContinueView extends StatelessWidget {
  const ContinueView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: homebackgroundColor,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAuthAppBar(numOfPage: 3),
            ),
            SliverToBoxAdapter(
              child: ContinueViewBody(),
            ),
          ],
        ),
      ),
    );
  }
}

