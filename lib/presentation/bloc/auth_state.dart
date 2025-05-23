import 'package:clear_architecture_flutter/domain/entities/user.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final User user;

  Authenticated(this.user);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
