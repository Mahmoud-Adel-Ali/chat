import 'package:chat/constant.dart';
import 'package:chat/core/utils/asset.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:chat/features/home/presentaion/views/widgets/chat_view_body.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimeColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mahmoud Adel Ali",
              style: Styles.textstyle25.copyWith(color: Colors.white),
            ),
            const Text(
              "  online",
              style: Styles.textstyle16,
            ),
          ],
        ),
        leading: CircleAvatar(
          child: Image.asset(Assets.logo),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_rounded,
                size: 30,
              )),
        ],
      ),
      body:  ChatViewBody(data:data),
    );
  }
}
