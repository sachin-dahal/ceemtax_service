import 'package:ceemtax_service/core/logger/logger.dart';
import 'package:ceemtax_service/data_source/authentication/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GetStorage box = GetStorage();

  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential _userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User _firebaseUser = _userCredential.user;
      UserModel user = UserModel(
        uid: _firebaseUser.uid,
        email: _firebaseUser.email,
      );
      box.write("uid", user.uid);
      Log.debug("Sign In USER: ", _firebaseUser.toString());
      Log.debug("Sign In User Model: ", user.uid + " " + user.email);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
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
      box.write("uid", user.uid);
      Log.debug("REGISTER USER: ", _firebaseUser.toString());
      Log.debug("Register User Model: ", user.uid + " " + user.email);
      return user;
    } catch (e) {
      throw "Error occured while regestering user";
    }
  }

  Future signOut() async {
    try {
      box.remove("uid");
      return await _auth.signOut();
    } catch (e) {
      throw "Error occured while regestering user";
    }
  }
}
