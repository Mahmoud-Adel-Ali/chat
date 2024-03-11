import 'package:chat/constant.dart';
import 'package:chat/core/utils/asset.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

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
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.test), fit: BoxFit.cover),
                ),
                // currentAccountPicture: UserImg(),
                currentAccountPictureSize: Size.square(100),
                accountName: Text("Mahmoud Adel"),
                accountEmail: Text(""),
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
