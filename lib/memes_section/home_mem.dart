import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_project/memes_section/Post.dart';

class InstagramHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 5,
        title: Text('Your Safety Apps'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle),
            color: Colors.black,
            iconSize: 40,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InstagramPostPage()),
              );
              // Handle post button click
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var posts = snapshot.data?.docs;

          return ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
              var post = posts?[index].data() as Map<String, dynamic>;

              return Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Post Header (Profile picture, username, etc.)
                    ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/image1.png'),
                      ),
                      title: Text(post['username']),
                      subtitle: Text(post['location']),
                    ),
                    // Post Image
                    Image.network(
                      post['imageUrl'], // Replace with the actual field name in your Firestore document
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    // Post Actions (like, comment, send)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {
                                // Handle like button click
                              },
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.bookmark_border),
                          onPressed: () {
                            // Handle bookmark button click
                          },
                        ),
                      ],
                    ),
                    // Post Caption
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        post['caption'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    // Comments Section (Optional)
                    // You can add a widget to display comments here
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
