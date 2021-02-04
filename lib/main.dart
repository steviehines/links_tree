import 'package:flutter/material.dart';
import 'package:links_tree/page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stevie',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: LandingPage(),
    );
  }
}
