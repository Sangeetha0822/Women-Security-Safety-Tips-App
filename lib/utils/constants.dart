import 'package:flutter/material.dart';

Color primaryColor = Color(0xfffc3b77);

void goTo(BuildContext context, Widget nextScreen) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => nextScreen,
      ));
}

dialogueBox(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(text),
    ),
  );
}

Widget progressIndicator(BuildContext context) {
  return Center(
      child: CircularProgressIndicator(
    backgroundColor: primaryColor,
    color: Colors.red,
    strokeWidth: 7,
  ));
}
const Color g1 = Color.fromRGBO(0, 0, 255, 1.0); // Replace with your desired blue shade
const Color g2 = Color.fromRGBO(173, 216, 230, 1.0);
const Color kInputColor = Color(0xff3C3C43);
const Color kButtonColor = Color(0xff78258B);
const Color kWhiteColor = Colors.white;
const kPrimaryColor = Color(0xff6849ef);
const kPrimaryLight = Color(0xff8a72f1);
const kPrimaryColor1 = Color(0xff6849ef);
const kPrimaryLight1 = Color(0xff8a72f1);
const kBottomNavigationBarItemSize = 24.0;
const kCategoryCardImageSize = 120.0;
const Color backgroundColor2 = Color(0xFF17203A);
const Color backgroundColorLight = Color(0xFFF2F6FF);
const Color backgroundColorDark = Color(0xFF25254B);
const Color shadowColorLight = Color(0xFF4A5367);
const Color shadowColorDark = Colors.black;
