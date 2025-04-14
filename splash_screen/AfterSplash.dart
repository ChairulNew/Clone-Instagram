import 'package:flutter/material.dart';

class AfterSplash extends StatelessWidget {
  const AfterSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Setelah Splash"),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          "Selamat datang di halaman utama!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
