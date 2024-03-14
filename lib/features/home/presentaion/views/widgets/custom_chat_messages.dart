import 'package:chat/features/home/data/models/message_model.dart';
import 'package:chat/features/home/presentaion/views/widgets/custom_your_friends_message.dart';
import 'package:chat/features/home/presentaion/views/widgets/custom_your_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomChatMessages extends StatelessWidget {
  const CustomChatMessages({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("userss")
            .doc(data['uid'])
            .collection(FirebaseAuth.instance.currentUser!.uid)
            .orderBy("time")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Somehthing went wrog"));
          }  else if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return ListView.builder(
              itemCount: messagesList.length,
              itemBuilder: (context, index) {
                return messagesList[index].uid ==
                        FirebaseAuth.instance.currentUser
                    ? CustomYourMessage(msgData: messagesList[index])
                    : CustomYourFriendsMessage(data: messagesList[index]);
              },
            );
          }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          
        },
      ),
    );
  }
}
