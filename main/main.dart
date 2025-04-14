import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          'https://cdn-images-1.medium.com/max/918/1*rb3JJRN2YfybijTcxQiiUQ.png',
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
          'https://static.thehoneycombers.com/wp-content/uploads/sites/4/2019/05/Bingin-Beach-Uluwatu-Bali-Indonesia.jpg',
      'caption': 'Santai dulu bro 🔥',
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
          currentIndex: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
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
