import 'package:chat/constant.dart';
import 'package:chat/core/widgets/custom_drawer.dart';
import 'package:chat/features/home/presentaion/views/widgets/frends_view_body.dart';
import 'package:flutter/material.dart';

class HomwView extends StatelessWidget {
  const HomwView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          // leading: Icon(Icons.add),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                ))
          ],
          automaticallyImplyLeading: true,
          backgroundColor: kPrimeColor,
          title: const Text("Messages(45)"),
          centerTitle: true,
          bottom: const TabBar(
            indicatorWeight: 5,
            dividerHeight: 0,
            indicatorPadding: EdgeInsets.all(5),
            tabs: [
              Tab(child: Text("Friends")),
              Tab(child: Text("Groups")),
              Tab(child: Text("Add")),
            ],
          ),
        ),
        body: const TabBarView(children: [
          FriendsViewBody(),
          Text("2"),
          Text("3"),
        ]),
      ),
    );
  }
}
