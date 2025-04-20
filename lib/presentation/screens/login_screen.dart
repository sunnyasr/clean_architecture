import 'package:clear_architecture_flutter/presentation/bloc/auth_bloc.dart';
import 'package:clear_architecture_flutter/presentation/bloc/auth_event.dart';
import 'package:clear_architecture_flutter/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

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
                        LoginRequested(emailCtrl.text, passwordCtrl.text),
                      );
                    },
                    child: Text("Login"),
                  ),
        
                  ElevatedButton(
                    onPressed: () {
                     Navigator.pushReplacementNamed(context, "/signup");
                    },
                    child: Text("Goto SignUp"),
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {
            if (state is Authenticated) {
              debugPrint("Login success");
            } else if (state is AuthError) {
              debugPrint(state.message);
            }
          },
        ),
      ),
    );
  }
}
