import 'package:flutter/material.dart';
import 'package:retry_news_feed/view/screens/home_screen.dart';
import 'package:retry_news_feed/style/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News Feed",
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: BoldFont,
      ),
      home: HomeScreen(),
    );
  }
}
