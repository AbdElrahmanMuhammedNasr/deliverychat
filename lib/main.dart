import 'package:flutter/material.dart';
import 'package:flutter_main_app/login/Login.dart';
import 'package:flutter_main_app/welome/Welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   _seenWelcome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("seen");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
              color: Colors.black.withOpacity(0.8),
              child: _seenWelcome() != true ? new Login() :new Welome()),
        ),
      ),
    );
  }
}
