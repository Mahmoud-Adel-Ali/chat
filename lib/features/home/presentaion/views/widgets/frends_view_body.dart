import 'package:chat/features/home/presentaion/views/widgets/custom_one_frend_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FriendsViewBody extends StatelessWidget {
  const FriendsViewBody({super.key});
  getUsers() {
    return FirebaseFirestore.instance
            .collection("userss")
            .orderBy("name", descending: true)
            .snapshots();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: StreamBuilder<QuerySnapshot>(
        stream: getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Somehthing went wrog"));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;// 'name' 'phone' 'imgUrl'
                return data['uid']!=(FirebaseAuth.instance.currentUser?.uid ) ?
                  CustomOneFriendChat(data: data) : const SizedBox();//as Map
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
