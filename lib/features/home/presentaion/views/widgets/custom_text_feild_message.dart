


import 'package:flutter/material.dart';


class CustomTextFeildMessage extends StatelessWidget {
  CustomTextFeildMessage({super.key});
  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        cursorColor: Colors.white,
        controller: controller,
        onSubmitted: (data) {
          // BlocProvider.of<ChatCubit>(context)
          //     .sendMessage(message: data, email: email.toString());
          controller.clear();
          _controller.animateTo(0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        },
        decoration: InputDecoration(
          hintText: 'Send Message',
          hintFadeDuration: Duration(milliseconds: 500),
          hintStyle: TextStyle(color: Colors.white),
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
}
