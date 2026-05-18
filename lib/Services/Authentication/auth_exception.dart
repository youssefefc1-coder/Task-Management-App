import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management_app/generated/l10n.dart';

class FirebaseExceptions {
  String handleFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return S.current.weak_password;
      case 'email-already-in-use':
        return S.current.email_already_in_use;
      case 'invalid-email':
        return S.current.invalid_email;
      case 'user-not-found':
        return S.current.user_not_found;
      case 'wrong-password':
        return S.current.wrong_password;
      case 'invalid-credential':
        return S.current.invalid_credential;
      case 'user-disabled':
        return S.current.user_disabled;
      case 'too-many-requests':
        return S.current.too_many_requests;
      case 'operation-not-allowed':
        return S.current.operation_not_allowed;
      case 'network-request-failed':
        return S.current.network_request_failed;
      default:
        return S.current.something_went_wrong;
    }
  }
}
