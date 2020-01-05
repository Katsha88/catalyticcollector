import 'package:catalytic_collector/models/User1.dart';
import 'package:catalytic_collector/services/databaseuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:catalytic_collector/screens/authenticate/register.dart';

class AuthService1 {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  User1 _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User1(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User1> get user {
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password, String name, String phone) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      // create a new document for the user with the uid
      await DataUser(uid: user.uid).updateUserData(email, name, phone);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}