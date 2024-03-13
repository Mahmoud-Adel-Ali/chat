import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat/core/utils/flutter_awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CustomTextFeildMessage extends StatefulWidget {
  CustomTextFeildMessage({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<CustomTextFeildMessage> createState() => _CustomTextFeildMessageState();
}

class _CustomTextFeildMessageState extends State<CustomTextFeildMessage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        cursorColor: Colors.white,
        controller: controller,
        onSubmitted: (data) {
          sendMessage(msg: data);
          controller.clear();
          setState(() {});
        },
        decoration: InputDecoration(
          hintText: widget.data['uid'],
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
    final yourFriendsUid = widget.data['uid'];
    String messageId = const Uuid().v1();
    try {
      await FirebaseFirestore.instance
          .collection("userss")
          .doc(yourUid)
          .collection(yourFriendsUid)
          .doc(messageId)
          .set({
        'msg': msg,
        'uid': yourUid,
        'time': DateTime.now(),
      });
      print("First message/.............");
      await FirebaseFirestore.instance
          .collection("userss")
          .doc(yourFriendsUid)
          .collection(yourUid!)
          .doc(messageId)
          .set({
        'msg': msg,
        'uid': yourUid,
        'time': DateTime.now(),
      });
      print("second message/.............");
      awesomeDialog(
          context: context,
          dialogType: DialogType.success,
          title: 'Success',
          desc: 'message was sent');
    } catch (e) {
      awesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: 'Error',
          desc: "can't send message , some thing went wrong");
    }
  }
}
