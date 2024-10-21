import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:flutter_application_1/services/auth/auth_exceptions.dart';
import 'package:flutter_application_1/services/auth/auth_provider.dart';
import 'package:flutter_application_1/services/auth/auth_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthProvider _provider;
  AuthBloc(AuthProvider provider)
      : _provider = provider,
        super(AuthState(authStatus: AuthStatus.initial)) {
    on<AuthEventInit>(_init);
    on<AuthEventSignUp>(_signUp);
    on<AuthEventSignIn>(_signIn);
    on<AuthEventSignOut>(_signOut);
    on<AuthEventDeleteAccount>(_delete);
    on<AuthEventPasswordReset>(_password);
    on<AuthEventVerifyEmail>(_verify);
  }

  Future<void> _init(AuthEventInit event, Emitter<AuthState> emit) async {
    final user = _provider.currentUser;
    if (user != null) {
      if (user.isEmailVerified) {
        emit(AuthState(authStatus: AuthStatus.signedIn, user: user));
      } else {
        emit(AuthState(authStatus: AuthStatus.needsVerification, user: user));
      }
    } else {
      emit(AuthState(authStatus: AuthStatus.signedOut));
    }
  }

  Future<void> _signUp(AuthEventSignUp event, Emitter<AuthState> emit) async {
    try {
      final user = await _provider.signUp(
        name: event.name,
        email: event.email,
        password: event.password,
      );

      emit(AuthState(
        authStatus: AuthStatus.needsVerification,
        user: user,
        shouldPop: true,
      ));
    } on EmailAlreadyInUseAuthException {
      emit(state.copyWith(error: 'This email has already been used'));
    } on TooManyRequestsAuthException {
      emit(state.copyWith(error: 'Too many requests made, please try again'));
    } on NoInternetAuthException {
      emit(state.copyWith(error: 'Looks like you are offline'));
    } on UserNotLoggedInAuthException {
      emit(state.copyWith(error: 'Could not create an account'));
    } on GenericAuthException {
      emit(state.copyWith(error: 'Something bad happened, please try again'));
    }
  }

  Future<void> _signIn(AuthEventSignIn event, Emitter<AuthState> emit) async {
    try {
      final user = await _provider.signIn(
        email: event.email,
        password: event.password,
      );
      if (user.isEmailVerified) {
        emit(AuthState(
          authStatus: AuthStatus.signedIn,
          user: user,
          shouldPop: true,
        ));
      } else {
        emit(AuthState(
          authStatus: AuthStatus.needsVerification,
          user: user,
          shouldPop: true,
        ));
      }
    } on TooManyRequestsAuthException {
      emit(state.copyWith(error: 'Too many requests made, please try again'));
    } on NoInternetAuthException {
      emit(state.copyWith(error: 'Looks like you are offline'));
    } on UserNotLoggedInAuthException {
      emit(state.copyWith(error: 'Could not fetch credentials of this user'));
    } on WrongPasswordAuthException {
      emit(state.copyWith(error: 'Invalid credentials'));
    } on WrongEmailAuthException {
      emit(state.copyWith(error: 'Invalid credentials'));
    } on GenericAuthException {
      emit(state.copyWith(error: 'Something bad happened, please try again'));
    } on UserDisabledAuthException {
      emit(
        state.copyWith(
          error:
              'Looks like there is a problem with your account, please contact with us via telegram: @USardorDev',
        ),
      );
    }
  }

  Future<void> _signOut(AuthEventSignOut event, Emitter<AuthState> emit) async {
    await _provider.signOut();
    emit(AuthState(authStatus: AuthStatus.signedOut));
  }

  Future<void> _verify(
    AuthEventVerifyEmail event,
    Emitter<AuthState> emit,
  ) async {
    await FirebaseAuth.instance.currentUser?.reload();
    await _provider.sendEmailVerification();
  }

  Future<void> _password(
    AuthEventPasswordReset event,
    Emitter<AuthState> emit,
  ) async {
    await _provider.sendPasswordReset(email: event.email);
  }

  Future<void> _delete(
    AuthEventDeleteAccount event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _provider.deleteAccount();
      emit(AuthState(authStatus: AuthStatus.signedOut, shouldPop: true));
    } on ReAuthNeededAuthException {
      emit(state.copyWith(error: 'To do this, please re-authenticate'));
    }
  }
}
