import 'package:firebase_auth/firebase_auth.dart' show User;

class AuthUser {
  final String id;
  final String name;
  final String email;
  final String? profilePicture;
  final bool isEmailVerified;

  AuthUser({
    required this.id,
    required this.name,
    required this.email,
    this.profilePicture,
    required this.isEmailVerified,
  });

  static AuthUser? fromFirebase(User? user) {
    if (user == null) return null;
    return AuthUser(
      id: user.uid,
      name: user.displayName!,
      email: user.email!,
      profilePicture: user.photoURL,
      isEmailVerified: user.emailVerified,
    );
  }
}
