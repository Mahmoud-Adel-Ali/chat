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
      height: 65,
      color: kPrimeColor,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:  [
          CustomCircle(
            childNumber: 1,
            pageNumber: numOfPage,
          ),
          const SizedBox(width: 5),
          CustomCircle(
            childNumber: 2,
            pageNumber: numOfPage,
          ),
          const SizedBox(width: 5),
          CustomCircle(
            childNumber: 3,
            pageNumber: numOfPage,
          ),
        ],
      ),
    );
  }
}
