import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../firebase_authentication/firebase_authentication.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const routeName = "/register_screen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailIdController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _nameIdController = new TextEditingController();
  final TextEditingController _phoneNumberController =
      new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailIdController.dispose();
    _passwordController.dispose();
    _nameIdController.dispose();
    _phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 70,
          ),
          const Text(
            "Register",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 200,
            width: 250,
            child: Image.asset("assets/images/Group 9.png"),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: _nameIdController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Name",
                  fillColor: Colors.transparent),
            ),
          ),
          const SizedBox(
            height: 15,
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
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              controller: _phoneNumberController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Phone Number",
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
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "DON’T HAVE AN ACCOUNT?",
                  style: TextStyle(fontSize: 17),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 17),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("LOG IN"),
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
        _passwordController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _nameIdController.text.isNotEmpty) {
      FirebaseAuthentication()
          .signUp(
              email: _emailIdController.text.trim(),
              password: _passwordController.text,
              name: _nameIdController.text.trim(),
              phoneNumber: _phoneNumberController.text)
          .then((result) {
        if (result == null) {
          Navigator.pushReplacementNamed(context, "/logo_screen");
        } else {
          var snackBar = SnackBar(content: Text(result));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    } else {
      var snackBar = const SnackBar(content: Text('Please Enter All Value'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
