import 'package:clear_architecture_flutter/data/datasources/auth_local_datasource.dart';
import 'package:clear_architecture_flutter/data/repositories/auth_repository_impl.dart';
import 'package:clear_architecture_flutter/domain/repositories/auth_repository.dart';
import 'package:clear_architecture_flutter/domain/usecases/get_user_use_case.dart';
import 'package:clear_architecture_flutter/domain/usecases/login_use_cases.dart';
import 'package:clear_architecture_flutter/domain/usecases/signup_use_cases.dart';
import 'package:clear_architecture_flutter/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //Bloc
  sl.registerFactory(
    () => AuthBloc(
      loginUseCases: sl(),
      signupUseCases: sl(),
      getUserUseCase: sl(),
    ),
  );


  //UseCases
  sl.registerLazySingleton(() => LoginUseCases(sl()));
  sl.registerLazySingleton(() => SignupUseCases(sl()));
  sl.registerLazySingleton(() => GetUserUseCase(sl()));

  //Repository

  sl.registerLazySingleton<AuthRepository>(()=>AuthRepositoryImpl(sl()));

  // Data Source
  sl.registerLazySingleton(()=>AuthLocalDatasource());
}
