//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/welcome_screen/welcome.dart';
//import 'package:mini_project/db/share_pref.dart';

//import 'package:mini_project/utils/flutter_background_services.dart';
////import 'package:mini_project/login/child/bottom_page.dart';

//import 'home_screen.dart';
//import 'login/login_screen.dart';

final navigatorkey = GlobalKey<ScaffoldMessengerState>();

void main() /*async*/ {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  //await MySharedPrefference.init();
  //await initializeService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Womens Safety App',
        // scaffoldMessengerKey: navigatorkey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.firaSansTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.blue,
        ),


        home: OnbodingScreen(),

    );
  }
}
/*import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Your App Name'), // Set your app name here
        ),
        body: YourContentWidget(), // Replace with your actual content widget
      ),
    );
  }
}

class YourContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Your main content goes here
    return Center(
      child: Text('Hello, Flutter!'),
    );
  }
}*/

// class CheckAuth extends StatelessWidget {
//   // const CheckAuth({Key? key}) : super(key: key);

//   checkData() {
//     if (MySharedPrefference.getUserType() == 'parent') {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
