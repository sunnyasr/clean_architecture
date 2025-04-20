import 'package:clear_architecture_flutter/domain/entities/user.dart';

import '../repositories/auth_repository.dart';

class GetUserUseCase {
  final AuthRepository repository;

  GetUserUseCase(this.repository);

  Future<User?> call() {
    return repository.getUser();
  }
}
