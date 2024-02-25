


import 'package:chat/constant.dart';
import 'package:chat/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: homebackgroundColor,
      body: HomeViewBody(),
    );
  }
}
