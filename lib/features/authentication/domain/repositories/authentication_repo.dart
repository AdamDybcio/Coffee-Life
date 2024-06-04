import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepo {
  screenRedirect();

  Future<UserCredential> registerWithEmailAndPassword(String email, String password);

  Future<void> sendEmailVerification();

  Future<UserCredential?> signInWithGoogle();

  Future<void> loginWithEmailAndPassword(String email, String password);

  Future<void> sendPasswordResetEmail(String email);

  Future<void> logout();

  Future<void> reAuthenticateWithEmailAndPassword(String email, String password);

  Future<void> deleteAccount();
}
