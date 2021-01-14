import 'package:ceemtax_service/core/logger/logger.dart';
import 'package:ceemtax_service/data_source/authentication/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential _userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User _firebaseUser = _userCredential.user;
      UserModel user = UserModel(
        uid: _firebaseUser.uid,
        email: _firebaseUser.email,
      );
      Log.debug("Sign In USER: ", _firebaseUser.toString());
      Log.debug("Sign In User Model: ", user.uid + " " + user.email);
      return user;
    } catch (e) {
      throw "Error occured while signing in";
    }
  }

  Stream<User> get userState {
    return _auth.authStateChanges();
  }

  Future registerWithEmail(String email, String password) async {
    try {
      UserCredential _userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User _firebaseUser = _userCredential.user;
      UserModel user = UserModel(
        uid: _firebaseUser.uid,
        email: _firebaseUser.email,
      );
      Log.debug("REGISTER USER: ", _firebaseUser.toString());
      Log.debug("Register User Model: ", user.uid + " " + user.email);
      return user;
    } catch (e) {
      throw "Error occured while regestering user";
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      throw "Error occured while regestering user";
    }
  }
}
