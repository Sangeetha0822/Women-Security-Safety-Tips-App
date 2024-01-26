import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Your App Name'), // Set your app name here
        ),
        //body: YourContentWidget(), // Replace with your actual content widget
      ),
    );
  }
}