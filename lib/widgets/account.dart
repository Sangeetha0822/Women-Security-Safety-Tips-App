import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountScreen extends StatelessWidget {
  final String userId; // Pass the user ID to this screen

  AccountScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings button click
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').doc(userId).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          var userData = snapshot.data?.data() as Map<String, dynamic>;

          return Column(
            children: [
              // User Information Section
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(userData['profileImageUrl']),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userData['username'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // User Stats Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        userData['postCount'].toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Posts'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        userData['followersCount'].toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Followers'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        userData['followingCount'].toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Following'),
                    ],
                  ),
                ],
              ),
              // User Posts Section
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: userData['postUrls'].length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      userData['postUrls'][index], // Replace with actual post image URLs
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
