import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../firebase_authentication/firebase_authentication.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = "/login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailIdController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailIdController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Text(
            "Login",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 200,
            width: 250,
            child: Image.asset("assets/images/Group 8.png"),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: _emailIdController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Email",
                  fillColor: Colors.transparent),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              inputFormatters: [LengthLimitingTextInputFormatter(6)],
              controller: _passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Password",
                  fillColor: Colors.transparent),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: ElevatedButton(
              onPressed: () {
                FirebaseSignIn();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "DON’T HAVE AN ACCOUNT?",
                  style: TextStyle(fontSize: 17),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 17),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/register_screen");
                  },
                  child: const Text("SIGN UP"),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  void FirebaseSignIn() {
    if (_emailIdController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      FirebaseAuthentication()
          .signIn(
              email: _emailIdController.text.trim(),
              password: _passwordController.text.trim())
          .then((result) {
        if (result == null) {
          Navigator.pushReplacementNamed(context, "/logo_screen");
        } else {
          var snackBar = SnackBar(content: Text(result));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    } else {
      var snackBar = SnackBar(content: Text('Please Enter All Value'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
