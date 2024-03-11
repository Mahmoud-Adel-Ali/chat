import 'package:chat/core/utils/asset.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:chat/features/home/presentaion/views/chat_view.dart';
import 'package:flutter/material.dart';

class CustomOneFriendChat extends StatelessWidget {
  const CustomOneFriendChat({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // GoRouter.of(context).push(AppRouter.chatView);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ChatView(),
        ));
      },
      child: ListTile(
        title:
            const Text("Mahmoud Adel", maxLines: 1, style: Styles.textstyle25),
        subtitle: const Text("how are you ❤🤗🙌",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Styles.textstyle16),
        leading: CircleAvatar(
          radius: 55,
          child: Image.asset(Assets.test),
        ),
        trailing: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.green[900],
              radius: 15,
              child: const Text("5"),
            ),
            const Text(
              "7:30 pm",
              style: Styles.textstyle16,
            ),
          ],
        ),
      ),
    );
  }
}
