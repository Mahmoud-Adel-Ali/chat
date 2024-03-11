// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'dart:io';
import 'dart:math';

import 'package:chat/constant.dart';
import 'package:chat/core/utils/asset.dart';
import 'package:chat/core/utils/flutter_toast.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_buttom.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_text_form_feild.dart';
import 'package:chat/features/home/presentaion/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' show basename;

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  String userName = '';
  late String imgName;
  late File imgPath;
  bool imgIsUploaded = false;
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
                child: imgIsUploaded
                    ? CustomImageContainer(imgPath: imgPath)
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
                    uploadImage(ImageSource.gallery);
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
          CustomButton(
              text: "Save",
              onTap: () {
                // GoRouter.of(context).go(AppRouter.homeView);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomwView(),
                ));
              }),
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
          imgIsUploaded = true;
        });
      } else {
        showFlutterToast(msg: "NO img selected");
      }
    } catch (e) {
      showFlutterToast(msg: "Error => $e");
    }
  }
}

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({
    super.key,
    required this.imgPath,
  });

  final File imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(160),
        child: Image.file(
          imgPath,
        ),
      ),
    );
  }
}
