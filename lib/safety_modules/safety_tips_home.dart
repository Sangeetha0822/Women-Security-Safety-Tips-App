import 'package:flutter/material.dart';
//import 'package:mini_project/safety_modules/self_awarness/course_screen.dart';
//import 'package:mini_project/safety_modules/self_awarness/reportissues.dart';
import 'package:mini_project/safety_modules/SelfDefence/self_defence.dart';
import 'package:mini_project/safety_modules/news/news.dart';
import 'package:mini_project/safety_modules/self_awarness/details_screen.dart';
import 'package:mini_project/safety_modules/videos/videos.dart';
//import 'package:mini_project/safety_modules/news/news.dart';
//import 'package:mini_project/safety_modules/videos/videos.dart';



class FeaturedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Be Safe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CategoryCard(
            categoryName: 'Self Awarness',
            color: Colors.cyan,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelfDefencePage()),
              );
            },
          ),
          CategoryCard(
            categoryName: 'Self Defence ',
            color: Colors.cyan,

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsScreen(title: 'Self Defence',)),
              );
            },
          ),
          CategoryCard(
            categoryName: 'Watch Videos',
            color: Colors.cyan,

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WatchVideosPage()),
              );
            },
          ),
          CategoryCard(
            categoryName: 'Google News',
            color: Colors.cyan,

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
  final VoidCallback onTap;
  final Color color;

  const CategoryCard({
    required this.categoryName,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              categoryName,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}






