import 'package:clear_architecture_flutter/domain/entities/user.dart';
import 'package:clear_architecture_flutter/domain/repositories/auth_repository.dart';

class LoginUseCases {
  final AuthRepository repository;

  LoginUseCases(this.repository);

  Future<User?> call(String email, String password) {
    return repository.login(email, password);
  }
}
