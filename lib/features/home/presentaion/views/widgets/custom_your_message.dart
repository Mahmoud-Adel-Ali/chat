
import 'package:chat/constant.dart';
import 'package:chat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomYourMessage extends StatelessWidget {
  const CustomYourMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 20, right: 60, bottom: 5, top: 10),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: const BoxDecoration(
            color: kYouMessage,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(25),
            ),
          ),
          child: const Text(
            "How are you 🙌♥ , can you help me : please ",
            style: Styles.messageStyle,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text("01:23"),
        )
      ],
    );
  }
}
