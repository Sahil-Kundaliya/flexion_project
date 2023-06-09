import 'package:firebase_core/firebase_core.dart';
import 'package:flexion_project/Screens/edit_profile_screen.dart';
import 'package:flexion_project/Screens/login_screen.dart';
import 'package:flexion_project/Screens/logo_description_screen.dart';
import 'package:flexion_project/Screens/register_screen.dart';
import 'package:flexion_project/Screens/web_screen.dart';
import 'package:flexion_project/api_headler/api_headler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/logo_screen.dart';
import 'Screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
            primaryColor: Colors.black,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "/": (context) => SplashScreen(),
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
