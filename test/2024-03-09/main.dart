import 'package:flutter/material.dart';

void main() => runApp(CustomApp());

class CustomApp extends StatelessWidget {
  const CustomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color.fromRGBO(0, 0, 0, 0.0),
      title: 'Title, Hello, World123',
      home: Scaffold(
        body: Text(',Body, Hello, World4567'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

