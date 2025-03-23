import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final List<Map<String, String>> stories = const [
    {'name': 'chairulll.__', 'image': 'assets/chairul.jpg'},
    {
      'name': 'arul',
      'image': 'https://via.placeholder.com/150/00FF00/FFFFFF?text=B',
    },
    {
      'name': 'Ngabbrull',
      'image': 'https://via.placeholder.com/150/0000FF/FFFFFF?text=C',
    },
    {
      'name': 'Uzumaki Naruto',
      'image': 'https://via.placeholder.com/150/FFFF00/FFFFFF?text=D',
    },
    {
      'name': 'Monkey D. Luffy',
      'image': 'https://via.placeholder.com/150/FF00FF/FFFFFF?text=E',
    },
    {
      'name': 'Portgas D. Ace',
      'image': 'https://via.placeholder.com/150/FF4500/FFFFFF?text=F',
    },
  ];

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
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  final story = stories[index];
                  final imagePath = story['image']!;

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
                            image: DecorationImage(
                              image:
                                  imagePath.contains('assets/')
                                      ? AssetImage(imagePath) as ImageProvider
                                      : NetworkImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          story['name']!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
