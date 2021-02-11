import 'package:flutter/material.dart';
import 'package:rotomotive/Screens/Approval.dart';
import 'package:rotomotive/Screens/DesignSetup.dart';
import 'package:rotomotive/Screens/EnterItem.dart';
import 'package:rotomotive/Screens/Report.dart';

class Home extends StatefulWidget {
  static final String id = "Home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String username;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Welcome Admin"),
                Text("ROTOMAG"),
                FlatButton(
                  onPressed: () {},
                  child: Text("Logout"),
                ),
              ],
            ),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: "Design Parameter Setup",),
                Tab(text: "Enter Item",),
                Tab(text: "Approval",),
                Tab(text: "Report",),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              DesignSetup(),
              EnterItem(),
              Approval(),
              Report(),
            ],
          ),
        ),
      ),
    );
  }
}