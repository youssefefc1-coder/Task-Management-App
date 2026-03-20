import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_management_app/Services/Authentication/auth_exception.dart';

class AuthServices {
  Future<String?> signup(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.sendEmailVerification();
      return null;
    } on FirebaseAuthException catch (e) {
      return FirebaseExceptions().handleFirebaseError(e);
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (!userCredential.user!.emailVerified) {
        return "Please Verify your email before logging in.";
      }
      return null;
    } on FirebaseAuthException catch (e) {
      return FirebaseExceptions().handleFirebaseError(e);
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String?> signinWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      try {
        await googleSignIn.disconnect();
      } catch (e) {}

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) return "Sign in cancelled";

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }
}
