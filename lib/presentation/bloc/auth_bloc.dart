import 'package:clear_architecture_flutter/domain/usecases/get_user_use_case.dart';
import 'package:clear_architecture_flutter/domain/usecases/login_use_cases.dart';
import 'package:clear_architecture_flutter/domain/usecases/signup_use_cases.dart';
import 'package:clear_architecture_flutter/presentation/bloc/auth_event.dart';
import 'package:clear_architecture_flutter/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCases loginUseCases;
  final SignupUseCases signupUseCases;
  final GetUserUseCase getUserUseCase;

  AuthBloc({
    required this.loginUseCases,
    required this.signupUseCases,
    required this.getUserUseCase,
  }) : super(AuthInitial()) {
    on<LoginRequested>(_onLogin);
    on<SignupRequested>(_onSignup);
    on<LoadUserRequested>(_onLoadUser);
  }

  Future<void> _onLogin(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final user = await loginUseCases(event.email, event.password);
    user != null ? emit(Authenticated(user)) : emit(AuthError("Login failed"));
  }

  Future<void> _onSignup(SignupRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final user = await signupUseCases(event.name, event.email, event.password);
    user != null ? emit(Authenticated(user)) : emit(AuthError("Signup failed"));
  }

  Future<void> _onLoadUser(
    LoadUserRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final user = await getUserUseCase();
    user != null ? emit(Authenticated(user)) : emit(AuthInitial());
  }
}
