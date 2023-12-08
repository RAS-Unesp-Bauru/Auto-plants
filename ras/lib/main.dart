import 'package:flutter/material.dart';
import 'package:ras/screens/menuScreen.dart';
import 'package:ras/screens/loadingScreen.dart';
import 'package:ras/screens/tabelaScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MenuScreen(),
        '/LS': (context) => const LoadingScreen(),
        '/TS': (context) => const TabelaScreen(),
      },
    );
  }
}
