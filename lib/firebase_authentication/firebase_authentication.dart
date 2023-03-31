import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  //SIGN UP METHOD
  Future signUp(
      {String email = '',
      String password = '',
      String name = '',
      String phoneNumber = ''}) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await db.collection('Users').doc(email).set({
        'name': name,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password
      });
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN IN METHOD
  Future signIn({String email = '', String password = ''}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      preferences.setString(
        'email',
        email,
      );
      preferences.setString('password', password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await _auth.signOut();
    preferences.clear();
    // preferences.remove('email');
    // preferences.remove('password');
    print('signout');
  }
}
