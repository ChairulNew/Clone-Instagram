import 'dart:async';
import 'package:flutter/material.dart';
import '../lib/main.dart'; // ganti dengan halaman tujuan kamu
import './AfterSplash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const AfterSplash()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(image: AssetImage("assets/logo_launcher.png"), width: 150),
      ),
    );
  }
}
