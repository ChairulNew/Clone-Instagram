import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Instagram"),
          actions: [
            IconButton(
              onPressed: () {
                print("Tombol di tekan");
              },
              icon: const Icon(Icons.favorite),
            ),
            IconButton(
              onPressed: () {
                print("Tombol di tekan");
              },
              icon: const Icon(Icons.message),
            ),
          ],
        ),
      ),
    );
  }
}
