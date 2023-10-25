import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  Future loginUserwithEmailandPassword(String email, String password) async {
    try {
      UserCredential user = await (_auth.signInWithEmailAndPassword(
          email: email, password: password));
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signUpUserwithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      UserCredential user = await (_auth.createUserWithEmailAndPassword(
          email: email, password: password));
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future googlesignInMethod() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signOutMethod() async {
    try {
      await googleSignIn.disconnect();
      await _auth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
