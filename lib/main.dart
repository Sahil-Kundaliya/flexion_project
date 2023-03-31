import 'package:flexion_project/Screens/edit_profile_screen.dart';
import 'package:flexion_project/Screens/login_screen.dart';
import 'package:flexion_project/Screens/logo_description_screen.dart';
import 'package:flexion_project/Screens/register_screen.dart';
import 'package:flexion_project/Screens/web_screen.dart';
import 'package:flexion_project/api_headler/api_headler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/logo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiHeadler>(
          create: (_) => ApiHeadler(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LogoScreen(),
          initialRoute: "/logo_screen",
          routes: {
            "/login_screen": (context) => LoginScreen(),
            "/register_screen": (context) => RegisterScreen(),
            "/logo_screen": (context) => LogoScreen(),
            "/logo_description_screen": (context) => LogoDescription(),
            "/web_screen": (context) => WebScreen(),
            "/edit_profile_screen": (context) => EditProfileScreen(),
          }),
    );
  }
}
