class AuthException implements Exception {
  const AuthException();
}

// login exceptions
class UserDisabledAuthException implements AuthException {}

class WrongPasswordAuthException implements AuthException {}

class WrongEmailAuthException implements AuthException {}

// register exceptions
class EmailAlreadyInUseAuthException implements AuthException {}

class TooManyRequestsAuthException implements AuthException {}

// generic exceptions
class GenericAuthException implements AuthException {}

class NoInternetAuthException implements AuthException {}

class ReAuthNeededAuthException implements AuthException {}

class UserNotLoggedInAuthException implements AuthException {}
