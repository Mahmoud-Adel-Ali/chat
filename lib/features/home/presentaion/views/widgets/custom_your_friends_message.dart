import 'package:chat/constant.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomYourFriendsMessage extends StatelessWidget {
  const CustomYourFriendsMessage({super.key, required this.msgData});
  final Map<String,dynamic> msgData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // SizedBox(height: 20),
        Container(
          margin:
              const EdgeInsets.only(right: 20, left: 60, bottom: 5, top: 10),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
          // width: MediaQuery.of(context).size.width * 0.75,
          decoration: const BoxDecoration(
            color: kFriendsMessage,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Text(
            msgData['msg'],
            style: Styles.messageStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Text(
            DateFormat(" hh:mm a").format(msgData['time'].toDate()),
          ),
        )
      ],
    );
  }
}
