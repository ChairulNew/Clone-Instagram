import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index == 0) {
      // kembali ke home
      Navigator.pop(context);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ---------------------
      // APP BAR
      // ---------------------
      appBar: AppBar(
        title: const Text("Search Instagram"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),

      // ---------------------
      // BODY CONTENT
      // ---------------------
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ), // Menambahkan border
                ),
              ),
            ),
          ),

          // Grid Gambar
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 kolom
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "https://picsum.photos/id/${index + 10}/200/200",
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // ---------------------
      // BOTTOM NAVIGATION
      // ---------------------
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 1,
            ), // Menambahkan border atas pada Bottom Navigation
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
        ),
      ),
    );
  }
}
