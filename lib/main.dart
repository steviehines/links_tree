import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:links_tree/page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUploaded = false;
  @override
  void initState() {
    super.initState();

    upload();
  }

  Future upload() async {
    //Initialize Firebase
    await Firebase.initializeApp();

    //Upload document to FireStore
    final refUser = FirebaseFirestore.instance.collection('auser').doc();
    await refUser.set({'username': 'AleX'});
    //Upload file to Firebase Storage
    final response = await http.get(
        'https://pbs.twimg.com/profile_images/1120994736523837440/SXM3Ceue_400x400.jpg');
    final imageBytes = response.bodyBytes;

    final refImage = FirebaseStorage().ref().child('images/mine.jpg');
    final uploadTask = refImage.putData(imageBytes);
    await uploadTask.onComplete;

    setState(() {
      isUploaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stevie',
      theme: ThemeData(primarySwatch: Colors.amber, fontFamily: 'Ubuntu'),
      home: LandingPage(),
    );
  }
}
