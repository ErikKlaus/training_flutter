import 'package:flutter/material.dart';
import 'package:training_flutter/day_16/view/drawer_global.dart';
import 'package:training_flutter/day_16/view/login_screen.dart';
import 'package:training_flutter/day_16/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day 16 App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreenDay16(),
        '/login': (context) => const LoginScreenDay16(),
        '/drawer': (context) => const DrawerGlobal(),
      },
    );
  }
}
