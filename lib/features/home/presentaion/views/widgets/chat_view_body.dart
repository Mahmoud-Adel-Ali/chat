import 'package:chat/features/home/presentaion/views/widgets/custom_chat_messages.dart';
import 'package:chat/features/home/presentaion/views/widgets/custom_text_feild_message.dart';
import 'package:flutter/material.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomChatMessages(),
        CustomTextFeildMessage(),
      ],
    );
  }
}

