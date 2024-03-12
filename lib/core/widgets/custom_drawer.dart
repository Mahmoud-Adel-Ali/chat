import 'package:chat/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late DocumentSnapshot<Map<String, dynamic>> data;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getDataOfurrentUser();
  }

  getDataOfurrentUser() async {
    data = await FirebaseFirestore.instance
        .collection("userss")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      backgroundColor: kPrimeColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.black),
                      currentAccountPictureSize: Size.square(100),
                      accountName: Text(data['name']),
                      accountEmail: Text(data['phone']),
                      currentAccountPicture: CircleAvatar(
                        child: ClipOval(
                          child: Image.network(data['imgUrl']),
                        ),
                      ),
                    ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("profile"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.help_center),
                title: const Text("about "),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Logout"),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Devoloped by \"Mahmoud Adel Ali\"",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
