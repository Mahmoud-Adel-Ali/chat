import 'package:chat/constant.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_circle.dart';
import 'package:flutter/material.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({
    super.key,
    required this.numOfPage,
  });
  final int numOfPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.075,
      color: kPrimeColor,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CustomCircle(
            isComplete: numOfPage == 1,
            childNumber: 1,
          ),
          const SizedBox(width: 5),
          CustomCircle(
            isComplete: numOfPage == 2,
            childNumber: 2,
          ),
          const SizedBox(width: 5),
          CustomCircle(
            isComplete: numOfPage == 3,
            childNumber: 3,
          ),
        ],
      ),
    );
  }
}
