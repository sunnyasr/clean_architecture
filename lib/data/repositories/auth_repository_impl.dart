import 'package:clear_architecture_flutter/data/datasources/auth_local_datasource.dart';
import 'package:clear_architecture_flutter/domain/entities/user.dart';
import 'package:clear_architecture_flutter/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<User?> getUser() {
    return datasource.getUser();
  }

  @override
  Future<User?> login(String email, String password) {
    return datasource.login(email, password);
  }

  @override
  Future<User?> signup(String name, String email, String password) {
    return datasource.signup(name, email, password);
  }
}
