import 'package:flutter/material.dart';
import 'package:mini_project/login/login_screen.dart';
import 'package:mini_project/login/register.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.white : Colors.lightBlueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title above logo image
          Text(
            'We Welcome You',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 20.0), // Add space between title and logo image
          // Logo image
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/new_logo_bg.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 20.0), // Add space between logo image and text
          // Welcome text
          Text(
            'Embrace Fear, Embody Strength',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
          const SizedBox(height: 20.0), // Add space between text and buttons
          // Login button
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to LoginScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyLogin()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              child: Text("Login".toUpperCase()),
            ),
          ),
          const SizedBox(height: 10.0), // Add space between buttons
          // Signup button
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: OutlinedButton(
              onPressed: () {
                // Navigate to RegisterScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterParentScreen()),
                );
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                side: BorderSide(color: Colors.black),
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              child: Text("SignUp".toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }
}
