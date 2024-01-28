import 'package:flutter/material.dart';
import 'package:mini_project/safety_modules/SelfDefence/self_defence.dart';
import 'package:mini_project/safety_modules/news/news.dart';
import 'package:mini_project/safety_modules/self_awarness/details_screen.dart';
import 'package:mini_project/safety_modules/videos/videos.dart';

class FeaturedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Be Safe'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: GridView.count(
        crossAxisCount: 2, // Set the number of columns in the grid
        crossAxisSpacing: 16.0, // Set the spacing between columns
        mainAxisSpacing: 16.0, // Set the spacing between rows
        padding: EdgeInsets.all(16.0), // Set padding for the entire grid
        children: [
          CategoryCard(
            categoryName: 'Self Awarness',
            icon: Icons.accessibility, // Set the icon for this category
            color: Colors.lightBlueAccent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelfDefencePage()),
              );
            },
          ),
          CategoryCard(
            categoryName: 'Self Defence',
            icon: Icons.security, // Set the icon for this category
            color: Colors.lightBlueAccent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(title: 'Self Defence'),
                ),
              );
            },
          ),
          CategoryCard(
            categoryName: 'Watch Videos',
            icon: Icons.video_library, // Set the icon for this category
            color: Colors.lightBlueAccent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WatchVideosPage()),
              );
            },
          ),
          CategoryCard(
            categoryName: 'Google News',
            icon: Icons.new_releases, // Set the icon for this category
            color: Colors.lightBlueAccent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GoogleNewsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  const CategoryCard({
    required this.categoryName,
    required this.icon,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white), // Small icon at the top
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  categoryName,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        color: color,
      ),
    );
  }
}
