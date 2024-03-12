import 'package:chat/core/utils/styles.dart';
import 'package:chat/features/home/presentaion/views/chat_view.dart';
import 'package:flutter/material.dart';

class CustomOneFriendChat extends StatelessWidget {
  const CustomOneFriendChat({super.key, required this.data});

  final Map<String,dynamic> data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        // GoRouter.of(context).push(AppRouter.chatView);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  ChatView(data: data,),
        ));
        },
      child: ListTile(
        title:
             Text(data['name'], maxLines: 1, style: Styles.textstyle25),
        subtitle:  Text(data['phone'],
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Styles.textstyle16),
        leading: CircleAvatar(
          radius: 55,
          child: ClipOval(child: Image.network(data['imgUrl'])),
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
