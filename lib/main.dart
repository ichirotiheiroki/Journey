import 'package:flutter/material.dart';
import 'package:journey/pages/navpages/main_page.dart';
import 'package:journey/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      // home: const WelcomePage(),
      home: const MainPage(),
    );
  }
}
