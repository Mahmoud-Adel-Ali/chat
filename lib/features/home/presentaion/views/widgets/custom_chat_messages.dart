import 'package:chat/features/home/presentaion/views/widgets/custom_your_friends_message.dart';
import 'package:chat/features/home/presentaion/views/widgets/custom_your_message.dart';
import 'package:flutter/material.dart';

class CustomChatMessages extends StatelessWidget {
  const CustomChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          SizedBox(height: 25),
          CustomYourMessage(),
          CustomYourFriendsMessage(),
          CustomYourMessage(),
          CustomYourFriendsMessage(),
          CustomYourMessage(),
          CustomYourFriendsMessage(),
        ],
      ),
    );
  }
}


