import 'package:clear_architecture_flutter/domain/entities/user.dart';
import 'package:clear_architecture_flutter/domain/repositories/auth_repository.dart';

class SignupUseCases {
  final AuthRepository repository;

  SignupUseCases(this.repository);

  Future<User?> call(String name, String email, String password) {
    return repository.signup(name, email, password);
  }
}
