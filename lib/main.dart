import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:mini_project/memes_section/home_mem.dart';
import 'package:mini_project/welcome_screen/welcome.dart';
final navigatorkey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Platform. isAndroid
       await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyA77Cy7u8FrKBsFsRwFeUxptodpSKagsuw",
        appId: "1:224059079114:android:08ad13b00d60dc61663733",
        messagingSenderId: "224059079114",
        projectId: "womens-safety-tip-app",
      storageBucket: "womens-safety-tip-app.appspot.com",
     )
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Women\'s Safety App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.firaSansTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
      ),
      home:OnbodingScreen(),
      //home:InstagramHomePage(),
    );
  }
}
