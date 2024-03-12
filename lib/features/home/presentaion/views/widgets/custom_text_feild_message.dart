import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomTextFeildMessage extends StatelessWidget {
  CustomTextFeildMessage({super.key, required this.data});
  TextEditingController controller = TextEditingController();
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        cursorColor: Colors.white,
        controller: controller,
        onSubmitted: (data) {
          sendMessage(msg: data);
        },
        decoration: InputDecoration(
          hintText: data['uid'],
          hintFadeDuration: const Duration(milliseconds: 500),
          hintStyle: const TextStyle(color: Colors.white),
          suffixIcon: const Icon(
            Icons.send,
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  sendMessage({required msg}) async {
    final yourUid = FirebaseAuth.instance.currentUser?.uid;
    final yourFriendsUid = data['uid'];
    print(yourFriendsUid);
    print(yourUid);
  }
}
