import 'package:flutter/material.dart';
import 'package:teste/Botao.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: const Center(
        child: Column(
          children: [
            Botao(texto: 'Opt1', field:'temperature'),
            Botao(texto: 'Opt2', field:'humidity'),
          ],
        )
      )
    );
  }
}
