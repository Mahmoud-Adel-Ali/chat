import 'package:chat/constant.dart';
import 'package:chat/features/home/presentaion/views/widgets/frends_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomwView extends StatelessWidget {
  const HomwView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                ))
          ],
          automaticallyImplyLeading: false,
          backgroundColor: kPrimeColor,
          title: const Text("Messages(45)"),
          bottom: const TabBar(
            indicatorWeight: 5,
            dividerHeight: 0,
            indicatorPadding: EdgeInsets.all(5),
            tabs: [
              Tab(child: Text("Frends")),
              Tab(child: Text("Groups")),
              Tab(child: Text("Add")),
            ],
          ),
        ),
        body: const TabBarView(children: [
          FrendsViewBody(),
          Text("2"),
          Text("3"),
        ]),
      ),
    );
  }
}
