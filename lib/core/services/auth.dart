import 'package:ceemtax_service/core/logger/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential _userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User _firebaseUser = _userCredential.user;
      Log.debug("Sign In USER: ", _firebaseUser.toString());
      return _firebaseUser;
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
      Log.debug("Sign In USER: ", _firebaseUser.toString());
      return _firebaseUser;
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
