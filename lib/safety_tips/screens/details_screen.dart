//import 'package:mini_project/safety_tips/models/lesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:mini_project/utils/constants.dart';
//import 'package:mini_project/safety_tips/safety_widgets/lesson_card.dart';

class DetailsScreen extends StatefulWidget {
  final String title;
  const DetailsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  //int _selectedTag = 0;

  void changeTab(int index) {
    setState(() {
      //_selectedTag = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Headline at the top
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 10),
                // Back Button
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                // Text with lines
                const Text(
                  "Identify Your responses :When you feel Yoursel  becoming overwhelmed by powerful emotions, take stock of what you're experiencing."
                      "Pellentesque vitae lectus ut justo feugiat accumsan. "
                      "Integer lacinia scelerisque libero, a cursus tortor porttitor quis. "
                      "Vestibulum eget ipsum id arcu congue convallis.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 15),
                // Image (Replace 'Image.network' with your actual image widget)
                /*Image.network(
                  'https://example.com/your-image-url.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 15),*/
               /* CustomTabView(
                  index: _selectedTag,
                  changeTab: changeTab,
                ),*/
                //_selectedTag == 0 ? const PlayList() : const Description(),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
