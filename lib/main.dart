import 'package:flutter/material.dart';
import 'package:teste/screens/menuScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.white(),
      home: const MenuScreen(),
    );
  }
}
