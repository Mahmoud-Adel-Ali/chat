import 'package:chat/core/utils/styles.dart';
import 'package:chat/features/auth/presentation/views/profile_view.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class ContinueViewBody extends StatelessWidget {
  const ContinueViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: Image.asset("assets/img/panda.jpeg"),
          ),
          const SizedBox(height: 40),
          const Text(
            "Congratulation your number is verified , click Continue to create your profile",
            style: Styles.textstyle27,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          CustomButton(
              text: "Continue",
              onTap: () {
                // GoRouter.of(context).go(AppRouter.profileView);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const ProfileView(),
                ));
              }),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
