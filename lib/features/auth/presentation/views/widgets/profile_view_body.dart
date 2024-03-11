// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'dart:io';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat/constant.dart';
import 'package:chat/core/utils/asset.dart';
import 'package:chat/core/utils/flutter_awesome_dialog.dart';
import 'package:chat/core/utils/flutter_toast.dart';
import 'package:chat/features/auth/data/cubit/phone_verify_cubit.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_buttom.dart';
import 'package:chat/features/auth/presentation/views/widgets/custom_text_form_feild.dart';
import 'package:chat/features/home/presentaion/views/home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' show basename;
import 'package:firebase_storage/firebase_storage.dart';

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
  bool isLoading = false;
  String url =
      'https://tse4.mm.bing.net/th?id=OIP.qgvE8Nd8S9_T0ioggfZWcAHaHw&pid=Api&P=0&h=220';
  @override
  Widget build(BuildContext context) {
    final blocProvide = BlocProvider.of<PhoneVerifyCubit>(context);
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
          isLoading
              ? const CircularProgressIndicator(color: kPrimeColor)
              : CustomButton(
                  text: "Save",
                  onTap: () {
                    addUser(phone: blocProvide.phoneNum);
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

  addUser({required String phone}) async {
    setState(() {
      isLoading = !isLoading;
    });
    try {
      final credential = FirebaseAuth.instance.currentUser;
      // Upload image to firebase storage
      final storageRef = FirebaseStorage.instance.ref(imgName);
      await storageRef.putFile(imgPath);
      // get the link of the of the photo
      url = await storageRef.getDownloadURL();
      CollectionReference users = FirebaseFirestore.instance.collection(
          'userss'); // name of yor collection  in your firebase firsestor

      await users
          .doc(credential?.uid) //'ABC123'
          .set({
            "phone": phone,
            "name": userName,
            "imgUrl": url,
          })
          .then((value) =>
              showFlutterToast(msg: "User Added")) //print("User Added")
          .catchError(
              (error) => showFlutterToast(msg: "Failed to add user: $error"));
      //print("Failed to add user: $error")

      //
    } on FirebaseAuthException catch (e) {
      // showSnackBar(context, e.code.toString());
      awesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: "Error",
          desc: e.toString());
    } catch (e) {
      awesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: "Error",
          desc: e.toString());
    }
    setState(() {
      isLoading = !isLoading;
    });
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
