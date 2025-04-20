import 'package:clear_architecture_flutter/domain/entities/user.dart';

class AuthLocalDatasource {
  User? _user;

  String? _password;

  Future<User?> login(String email, String password) async {
    if (_user != null && _user!.email == email && _password == password) {
      return _user;
    }
    return null;
  }

  Future<User?> signup(String name, String email, String password) async {
    _user = User(name: name, email: email);
    _password = password;
    return _user;
  }

  Future<User?> getUser() async => _user;
}
