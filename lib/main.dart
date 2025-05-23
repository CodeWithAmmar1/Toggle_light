import 'package:app/bloc/light_bloc.dart';
import 'package:app/screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LightBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen()),
    );
  }
}
