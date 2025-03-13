import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Instagram"),
          actions: [
            IconButton(
              onPressed: () => print("Tombol Favorite ditekan"),
              icon: const Icon(Icons.favorite),
            ),
            IconButton(
              onPressed: () => print("Tombol Message ditekan"),
              icon: const Icon(Icons.message),
            ),
          ],
        ),
        body: Column(
          children: [
            // STORY SECTION
            SizedBox(
              height: 120, // Tinggi area story
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Scroll horizontal
                itemCount: 10, // Jumlah story
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.red, width: 3),
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://via.placeholder.com/', // Gambar contoh
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(" $index", style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                },
              ),
            ),

            // KONTEN UTAMA
            const Expanded(child: Center(child: Text("Konten instagram"))),
          ],
        ),
      ),
    );
  }
}
