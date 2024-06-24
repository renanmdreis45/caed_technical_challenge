import 'package:caed_technical_challenge/core/di/injection_container.dart';
import 'package:caed_technical_challenge/presentation/view/pages/login/login_page.dart';
import 'package:caed_technical_challenge/presentation/view/view_model/bloc/box/box_bloc.dart';
import 'package:caed_technical_challenge/presentation/view/view_model/bloc/box/box_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeDependencies();
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BoxBloc>(
      create: (context) => sl()..add(const GetBox()),
      child: MaterialApp(
        title: 'Caed Technical Challenge',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}