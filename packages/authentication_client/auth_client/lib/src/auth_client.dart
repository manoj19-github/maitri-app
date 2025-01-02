import 'dart:async';

import 'package:auth_client/src/models/models.dart';

abstract class AuthenticationException implements Exception {
  const AuthenticationException(this.error);

  final Object error;

  @override
  String toString() => 'Authentication exception error: $error';
}

class SendLoginEmailLinkFailure extends AuthenticationException {
  const SendLoginEmailLinkFailure(super.error);
}

class IsLogInWithEmailLinkFailure extends AuthenticationException {
  const IsLogInWithEmailLinkFailure(super.error);
}

class LogInWithEmailLinkFailure extends AuthenticationException {
  const LogInWithEmailLinkFailure(super.error);
}

class LogInWithPasswordFailure extends AuthenticationException {
  const LogInWithPasswordFailure(super.error);
}

class LogInWithPasswordCanceled extends AuthenticationException {
  const LogInWithPasswordCanceled(super.error);
}

class LogInWithAppleFailure extends AuthenticationException {
  const LogInWithAppleFailure(super.error);
}

class LogInWithGoogleFailure extends AuthenticationException {
  const LogInWithGoogleFailure(super.error);
}

class LogInWithGoogleCanceled extends AuthenticationException {
  const LogInWithGoogleCanceled(super.error);
}

class LogInWithGithubFailure extends AuthenticationException {
  const LogInWithGithubFailure(super.error);
}

class LogInWithGithubCanceled extends AuthenticationException {
  const LogInWithGithubCanceled(super.error);
}

class LogInWithTwitterFailure extends AuthenticationException {
  const LogInWithTwitterFailure(super.error);
}

class LogInWithTwitterCanceled extends AuthenticationException {
  const LogInWithTwitterCanceled(super.error);
}

class SignUpWithPasswordFailure extends AuthenticationException {
  const SignUpWithPasswordFailure(super.error);
}

class SendPasswordResetEmailFailure extends AuthenticationException {
  const SendPasswordResetEmailFailure(super.error);
}

class ResetPasswordFailure extends AuthenticationException {
  const ResetPasswordFailure(super.error);
}

class LogOutFailure extends AuthenticationException {
  const LogOutFailure(super.error);
}

abstract class AuthenticationClient {
  Stream<AuthenticationUser> get user;

  Future<void> logInWithPassword({
    required String password,
    String? email,
    String? phone,
  });

  Future<void> logInWithGoogle();

  Future<void> logInWithGithub();

  Future<void> signUpWithPassword({
    required String password,
    required String fullName,
    required String username,
    String? avatarUrl,
    String? email,
    String? phone,
    String? pushToken,
  });

  Future<void> sendPasswordResetEmail({
    required String email,
    String? redirectTo,
  });

  Future<void> resetPassword({
    required String token,
    required String email,
    required String newPassword,
  });

  Future<void> logOut();
}
