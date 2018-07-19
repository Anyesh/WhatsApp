import "package:flutter/material.dart";
import "./chat_page.dart";

class Landing extends StatefulWidget {
  @override
  State createState() => LandingState();
}

class LandingState extends State<Landing> with TickerProviderStateMixin {
  var fabIcon = Icons.favorite;
  TabController tabController;
  @override
  void initState() {
    super.initState();

    tabController = TabController(vsync: this, length: 4)
      ..addListener(() {
        setState(() {
          switch (tabController.index) {
            case 0:
              break;

            case 1:
              fabIcon = Icons.message;
              break;

            case 2:
              fabIcon = Icons.book;
              break;

            case 3:
              fabIcon = Icons.call;
              break;
          }
        });
      });
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w600)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.more_vert),
          )
        ],
        backgroundColor: (Colors.greenAccent),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(child: Text("CHATS")),
            Tab(child: Text("STSTUS")),
            Tab(child: Text("CALLS"))
          ],
          indicatorColor: Colors.white,
          controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          Icon(Icons.camera_alt),
          ChatPage(),
          Text("Status Screen"),
          Text("Call Screen")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('pressed');
        },
        child: Icon(fabIcon),
        backgroundColor: Colors.red,
      ),
    );
  }
}
