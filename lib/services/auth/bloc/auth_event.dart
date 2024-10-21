part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

class AuthEventInit implements AuthEvent {
  const AuthEventInit();
}

class AuthEventSignUp implements AuthEvent {
  final String name;
  final String email;
  final String password;

  const AuthEventSignUp({
    required this.name,
    required this.email,
    required this.password,
  });
}

class AuthEventSignIn implements AuthEvent {
  final String email;
  final String password;

  const AuthEventSignIn({required this.email, required this.password});
}

class AuthEventPasswordReset implements AuthEvent {
  final String email;

  const AuthEventPasswordReset(this.email);
}

class AuthEventSignOut implements AuthEvent {
  const AuthEventSignOut();
}

class AuthEventDeleteAccount implements AuthEvent {
  const AuthEventDeleteAccount();
}

// TODO update name
class AuthEventUpdateName implements AuthEvent {
  const AuthEventUpdateName();
} // TODO update name

// TODO update email
class AuthEventUpdateEmail implements AuthEvent {
  const AuthEventUpdateEmail();
} // TODO update email

class AuthEventUpdatePhoto implements AuthEvent {
  const AuthEventUpdatePhoto();
}

//TODO implement AuthEventVerifyEmail
class AuthEventVerifyEmail implements AuthEvent {
  const AuthEventVerifyEmail();
}
