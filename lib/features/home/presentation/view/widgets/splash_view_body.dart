import 'package:chat/core/utils/app_router.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

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
          AnimatedBuilder(
              animation: slidingAnimation,
              builder: (context, _) {
                return SlideTransition(
                  position: slidingAnimation,
                  child: const Text(
                    "Chat",
                    style: Styles.textstyle45,
                  ),
                );
              }),
          const SizedBox(height: 70),
          // ElevatedButton(
          //   onPressed: () {
          //     GoRouter.of(context).push(AppRouter.phoneView);
          //   },
          //   style: const ButtonStyle(
          //       padding: MaterialStatePropertyAll(EdgeInsets.all(10))),
          //   child: Text(
          //     "Get Start",
          //     style: Styles.textstyle45.copyWith(fontSize: 28),
          //   ),
          // ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
    // rather than AnimatedBuilder
    // slidingAnimation.addListener(() {
    //   setState(() {});
    // });
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3, milliseconds: 450), () {
      GoRouter.of(context).push(AppRouter.phoneView);
    });
  }
}
