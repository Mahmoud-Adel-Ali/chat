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
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white,),
            );
          } else {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = //msg uid time
                    document.data()!
                        as Map<String, dynamic>; //msg uid time
                return (data['uid'] == FirebaseAuth.instance.currentUser!.uid)
                    ? CustomYourMessage(msgData: data)
                    : CustomYourFriendsMessage(msgData: data); //as Map
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
