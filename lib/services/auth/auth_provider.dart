import 'dart:async';

import 'package:flutter_application_1/services/auth/auth_user.dart';

// Every providers of this application should have these functionalities.
abstract class AuthProvider {
  AuthUser? get currentUser;
  Future<AuthUser> signIn({
    required String email,
    required String password,
  });
  Future<AuthUser> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<void> signOut();
  Future<void> deleteAccount();
  Future<void> sendEmailVerification();
  Future<void> sendPasswordReset({required String email});
}
