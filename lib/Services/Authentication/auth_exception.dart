import 'package:firebase_auth/firebase_auth.dart';

class FirebaseExceptions {
  String handleFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return 'Password must be at least 6 characters.';
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'user-not-found':
        return 'No account found with this email.';
      case 'wrong-password':
        return 'Incorrect password, please try again.';
      case 'invalid-credential':
        return 'Incorrect email or password.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many attempts, please try again later.';
      case 'operation-not-allowed':
        return 'This sign in method is not enabled.';
      case 'network-request-failed':
        return 'No internet connection, please check your network.';
      default:
        return 'Something went wrong, please try again.';
    }
  }
}
