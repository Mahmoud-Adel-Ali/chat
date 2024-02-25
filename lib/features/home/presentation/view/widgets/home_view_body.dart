import 'package:chat/features/home/presentation/view/widgets/welcom_container.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        WelcomeContainer(),
      ],
    );
  }
}
