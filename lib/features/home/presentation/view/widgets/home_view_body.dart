import 'package:chat/core/utils/app_router.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/img/scholar.png',
          ),
          const SizedBox(height: 20),
          const Text(
            "Chat",
            style: Styles.textstyle45,
          ),
          const SizedBox(height: 70),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.phoneView);
            },
            style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(10))),
            child: Text(
              "Get Start",
              style: Styles.textstyle45.copyWith(fontSize: 28),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
