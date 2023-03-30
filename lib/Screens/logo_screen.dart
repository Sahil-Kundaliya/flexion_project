import 'package:flutter/material.dart';

import '../widgets/logo_screen_widget.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 18),
          child: Text(
            "Logo",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
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
    ));
  }
}
