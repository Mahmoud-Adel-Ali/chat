// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'dart:io';
import 'dart:math';

import 'package:chat/constant.dart';
import 'package:chat/core/utils/asset.dart';
import 'package:chat/core/utils/flutter_toast.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_buttom.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' show basename;

class ProfileViewBody extends StatefulWidget {
  ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  String userName = '';
  late String imgName;
  late File imgPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Stack(
            children: [
              Center(
                child: imgName != null
                    ? ClipRRect(child: Image.file(imgPath))
                    : const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 80,
                        backgroundImage: AssetImage(Assets.test),
                      ),
              ),
              Positioned(
                right: MediaQuery.of(context).size.width * 0.20,
                bottom: 0,
                child: IconButton(
                  onPressed: () {
                    showFlutterToast(msg: "get image");
                  },
                  icon: const Icon(
                    Icons.add_a_photo,
                    color: kPrimeColor,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          CustomTextFormFeild(
              onChanged: (data) {
                userName = data;
              },
              validator: (data) {
                if (data!.isNotEmpty) return null;
                return null;
              },
              hinttext: "Enter your name",
              keyboardType: TextInputType.text),
          const SizedBox(height: 50),
          CustomButton(text: "Save", onTap: () {}),
        ],
      ),
    );
  }

  uploadImage(ImageSource imageSource) async {
    final pickedImg = await ImagePicker().pickImage(source: imageSource);
    try {
      if (pickedImg != null) {
        setState(() {
          imgPath = File(pickedImg.path);
          imgName = basename(pickedImg.path);
          int random = Random().nextInt(9999999);
          imgName = "$random$imgName";
        });
      } else {
        showFlutterToast(msg: "NO img selected");
      }
    } catch (e) {
      showFlutterToast(msg: "Error => $e");
    }
  }
}
