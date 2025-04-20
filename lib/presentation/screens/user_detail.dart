import 'package:clear_architecture_flutter/presentation/bloc/auth_bloc.dart';
import 'package:clear_architecture_flutter/presentation/bloc/auth_event.dart';
import 'package:clear_architecture_flutter/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
      if (state is Authenticated) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [Text(state.user.name), Text(state.user.email)],
              ),
            );
          }
      return Center(child: CircularProgressIndicator());

        },
        listener: (context, state) {
          if (state is Authenticated) {
            debugPrint("Login success");
          } else if (state is AuthError) {
            debugPrint(state.message);
          }
        },
      ),
    );
  }
}
