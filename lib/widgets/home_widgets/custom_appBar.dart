import 'package:flutter/material.dart';
import 'package:mini_project/utils/quotes.dart';

class CustomAppBar extends StatelessWidget {
  final Function()? onTap;
  final int? quoteIndex;

  CustomAppBar({this.onTap, this.quoteIndex});

  @override
  Widget build(BuildContext context) {
    // Make sure quoteIndex is not null before accessing sweetSayings list
    String quote = quoteIndex != null ? sweetSayings[quoteIndex!] : 'No Quote';

    return GestureDetector(
      onTap: () {
        onTap?.call(); // Using ?.call() is safer
      },
      child: Container(
        child: Text(
          quote,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
