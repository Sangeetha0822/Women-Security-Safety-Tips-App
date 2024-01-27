import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Women\'s Safety Awareness',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SelfDefencePage(),
    );
  }
}

class SelfDefencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Women\'s Safety Awareness'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSection('Personal Safety Tips', [
            _buildListItem('Be aware of your surroundings, both in public and private spaces.'),
            _buildListItem('Trust your instincts and listen to your gut feelings.'),
            _buildListItem('Avoid distractions like excessive phone use when walking alone.'),
          ]),
          _buildSection('Self-Defense Techniques', [
            _buildListItem('Join a self-defense class to learn practical techniques.'),
            _buildListItem('Use body strength and leverage in self-defense moves.'),
          ]),
          _buildSection('Digital Safety', [
            _buildListItem('Protect personal information online by using strong, unique passwords.'),
            _buildListItem('Review and update privacy settings on social media platforms regularly.'),
            _buildListItem('Recognize and report online harassment; seek support if needed.'),
          ]),
          // Add more sections as needed...
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Column(children: content),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildListItem(String text) {
    return ListTile(
      leading: Icon(Icons.check),
      title: Text(text),
    );
  }
}
