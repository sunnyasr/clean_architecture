import 'package:clear_architecture_flutter/presentation/screens/login_screen.dart';
import 'package:clear_architecture_flutter/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case '/details':
        return MaterialPageRoute(builder: (_) => SignupScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
