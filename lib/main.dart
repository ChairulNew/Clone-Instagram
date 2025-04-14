import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()),
  );
}

// ---------------------------
// SPLASH SCREEN
// ---------------------------
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Instagram Clone',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}

// ---------------------------
// MAIN APP
// ---------------------------
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Map<String, String>> stories = const [
    {'name': 'chairulll.__', 'image': 'assets/chairul.jpg'},
    {
      'name': 'BullBull',
      'image': 'https://via.placeholder.com/150/00FF00/FFFFFF?text=B',
    },
    {
      'name': 'ngabbrull',
      'image': 'https://via.placeholder.com/150/0000FF/FFFFFF?text=C',
    },
    {
      'name': 'afqa01',
      'image': 'https://via.placeholder.com/150/0000FF/FFFFFF?text=C',
    },
    {
      'name': 'chairumi',
      'image': 'https://via.placeholder.com/150/0000FF/FFFFFF?text=C',
    },
  ];

  final List<Map<String, String>> posts = const [
    {
      'username': 'chairulll.__',
      'profileImage': 'assets/chairul.jpg',
      'postImage':
          'https://miro.medium.com/v2/resize:fit:611/1*sQ3zLwfTFZZaHjkw3-4ITA.png',
      'caption': 'Halo, aku lagi mau sharing tentang pembelajaran flutter',
    },
    {
      'username': 'arul',
      'profileImage': 'https://via.placeholder.com/150/00FF00/FFFFFF?text=B',
      'postImage':
          'https://bimamedia-gurusiana.ap-south-1.linodeobjects.com/9acb47d1b8b945748d19fff46a555c01/2022/08/12/l-kopijpg20220812041755.jpeg',
      'caption': 'Jangan lupa ngopi dulu broder ☕',
    },
    {
      'username': 'Ngabbrull',
      'profileImage': 'https://via.placeholder.com/150/0000FF/FFFFFF?text=C',
      'postImage':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Pemandangan_Gunung_Kerinci_01.jpg/2560px-Pemandangan_Gunung_Kerinci_01.jpg',
      'caption': 'Santai dulu bro 🔥',
    },
  ];

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SearchPage()),
      );
    } else if (index == 2) {
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

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
              icon: const Icon(Icons.favorite_border),
            ),
            IconButton(
              onPressed: () => print("Tombol Message ditekan"),
              icon: const Icon(Icons.send),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Story Section
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    final story = stories[index];
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
                                    story['image']!.contains('assets/')
                                        ? AssetImage(story['image']!)
                                        : NetworkImage(story['image']!)
                                            as ImageProvider,
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

              // Post Section
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              post['profileImage']!.contains('assets/')
                                  ? AssetImage(post['profileImage']!)
                                  : NetworkImage(post['profileImage']!)
                                      as ImageProvider,
                        ),
                        title: Text(post['username']!),
                        trailing: const Icon(Icons.more_vert),
                      ),
                      Image.network(post['postImage']!),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () => print("Like ditekan"),
                          ),
                          IconButton(
                            icon: const Icon(Icons.comment),
                            onPressed: () => print("Comment ditekan"),
                          ),
                          IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () => print("Share ditekan"),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(post['caption']!),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ],
          ),
        ),

        // Bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library),
              label: 'Reels',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------
// Search Page
// ---------------------------
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cari Postingan")),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 15,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemBuilder: (context, index) {
          return Image.network(
            'https://picsum.photos/id/${index + 50}/200/200',
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
