import 'package:flutter/material.dart';
import 'package:flutter_main_app/welome/Welcome.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
              color: Colors.black.withOpacity(0.8),
              child: new Welome()),
        ),
      ),
    );
  }
}
