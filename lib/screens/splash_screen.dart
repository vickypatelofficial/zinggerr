import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zinggerr/screens/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  final Future<String> isLoggedIn;
  const SplashScreen({super.key, required this.isLoggedIn});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height.toString());
    print(MediaQuery.of(context).size.width.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Image.asset(
        errorBuilder: (context, error, stackTrace) {
          return SizedBox();
        },
        'assets/images/splash.png',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
    );
  }
}
