import 'package:clear_architecture_flutter/core/routers/app_router.dart';
import 'package:clear_architecture_flutter/presentation/bloc/auth_bloc.dart';
import 'package:clear_architecture_flutter/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initialize dependencies
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<AuthBloc>(create: (_) => di.sl<AuthBloc>())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: LoginScreen(),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
