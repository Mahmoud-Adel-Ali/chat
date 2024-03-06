import 'package:chat/features/home/presentaion/views/widgets/custom_one_frend_chat.dart';
import 'package:flutter/material.dart';

class FriendsViewBody extends StatelessWidget {
  const FriendsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return const CustomOneFriendChat();
        },
      ),
    );
  }
}
