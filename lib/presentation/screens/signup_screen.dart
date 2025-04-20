import 'package:clear_architecture_flutter/presentation/bloc/auth_bloc.dart';
import 'package:clear_architecture_flutter/presentation/bloc/auth_event.dart';
import 'package:clear_architecture_flutter/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator());
            }
        
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: nameCtrl,
                    decoration: InputDecoration(labelText: "Name"),
                  ),
                  TextField(
                    controller: emailCtrl,
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                  TextField(
                    controller: passwordCtrl,
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Password"),
                  ),
        
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        SignupRequested(
                          nameCtrl.text,
                          emailCtrl.text,
                          passwordCtrl.text,
                        ),
                      );
                    },
                    child: Text("SingUp"),
                  ),
        
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/");
                    },
                    child: Text("Goto Login"),
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {
            if (state is Authenticated) {
              debugPrint("Sign up successfully");
            } else if (state is AuthError) {
              debugPrint(state.message);
            }
          },
        ),
      ),
    );
  }
}
