import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    LoadData();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context)
          .pushReplacementNamed(_isLoading ? "/login_screen" : "/logo_screen"),
    );
  }

  Future<void> LoadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _isLoading = true;
    String? emailData = preferences.getString('email');
    String? passwordData = preferences.getString('password');
    if (emailData != null &&
        passwordData != null &&
        emailData.isNotEmpty &&
        passwordData.isNotEmpty) {
      _isLoading = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLogo(
        size: MediaQuery.of(context).size.height,
      ),
    );
  }
}
