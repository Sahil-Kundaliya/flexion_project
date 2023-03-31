import 'package:flutter/material.dart';

import '../firebase_authentication/firebase_authentication.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
              'https://cdn.oneesports.gg/cdn-data/2021/06/JujutsuKaisenPhantomParade_GojoSatoru-min.jpeg'),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'John Doe',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 50,
        ),
        Divider(),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed("/edit_profile_screen"),
          child: Container(
            height: 67,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Update Profile",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )),
            ),
          ),
        ),
        Divider(),
        GestureDetector(
          onTap: () {
            logOutUser();
            Navigator.of(context).pushReplacementNamed("/login_screen");
          },
          child: Container(
            height: 67,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }

  void logOutUser() {
    FirebaseAuthentication authentication = FirebaseAuthentication();
    authentication.signOut();
  }
}
