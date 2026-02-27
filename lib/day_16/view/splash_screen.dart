import 'package:flutter/material.dart';
import '../database/preference.dart';

class SplashScreenDay16 extends StatefulWidget {
  const SplashScreenDay16({super.key});

  @override
  State<SplashScreenDay16> createState() => _SplashScreenDay16State();
}

class _SplashScreenDay16State extends State<SplashScreenDay16> {
  @override
  void initState() {
    super.initState();
    goToLogin();
  }

  void goToLogin() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd61000),
      body: const Center(
        child: Image(
          image: AssetImage("assets/images/splash_logo.png"),
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}
