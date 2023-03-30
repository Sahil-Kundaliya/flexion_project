import 'package:flutter/material.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Title",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Expanded(
          child: SingleChildScrollView(),
        ));
  }
}