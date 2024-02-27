import 'package:chat/features/auth/presentation/views/widgets/custom_auth_app_bar.dart';
import 'package:flutter/material.dart';

class ContinueView extends StatelessWidget {
  const ContinueView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAuthAppBar(numOfPage: 3),
          ],
        ),
      ),
    );
  }
}
