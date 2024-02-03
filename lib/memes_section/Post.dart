import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InstagramPostPage extends StatefulWidget {
  @override
  _InstagramPostPageState createState() => _InstagramPostPageState();
}

class _InstagramPostPageState extends State<InstagramPostPage> {
  File? _selectedImage;
  TextEditingController _captionController = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _uploadPost() async {
    if (_selectedImage == null || _captionController.text.isEmpty) {
      // Handle validation or show a snackbar/error message
      return;
    }

    // Upload image to storage (you need to implement this part)

    // Get the download URL of the uploaded image from storage
    // For now, I'll use a placeholder URL
    String imageUrl = 'https://example.com/placeholder_image.jpg';

    // Get the user ID or any identifier for the post
    String userId = 'yourUserId'; // Replace with your logic to get user ID

    // Save post data to Firestore
    await FirebaseFirestore.instance.collection('posts').add({
      'userId': userId,
      'imageUrl': imageUrl,
      'caption': _captionController.text,
      // Add more fields as needed (e.g., timestamp, likes, comments)
    });

    // Clear the form
    setState(() {
      _selectedImage = null;
      _captionController.clear();
    });

    // Navigate back to the home page or do any other desired navigation
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _uploadPost,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _selectedImage != null
              ? Image.file(
            _selectedImage!,
            height: 200.0,
            width: 200.0,
            fit: BoxFit.cover,
          )
              : Placeholder(
            fallbackHeight: 200.0,
            fallbackWidth: 200.0,
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              _pickImage(ImageSource.gallery);
            },
            child: Text('Select Image'),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _captionController,
            decoration: InputDecoration(
              hintText: 'Add a caption...',
              contentPadding: EdgeInsets.all(16.0),
            ),
          ),
          SizedBox(height: 20.0),
          // Add more widgets for tagging users, location, etc.
        ],
      ),
    );
  }
}
