import 'package:clear_architecture_flutter/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User?> login(String email, String password);

  Future<User?> signup(String name, String email, String password);

  Future<User?> getUser();
}
