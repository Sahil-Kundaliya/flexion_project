import 'package:flexion_project/Screens/drawer_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/logo_screen_widget.dart';

class LogoScreen extends StatelessWidget {
  LogoScreen({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20),
                child: Text(
                  "Logo",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 40),
                child: GestureDetector(
                    onTap: () => scaffoldKey.currentState?.openDrawer(),
                    child: Icon(Icons.menu)),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return LogoScreenWidget();
              },
            ),
          )
        ],
      ),
      drawer: Drawer(child: DrawerScreen()),
    );
  }
}
