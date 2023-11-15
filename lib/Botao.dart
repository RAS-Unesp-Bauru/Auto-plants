import 'package:flutter/material.dart';
import 'package:teste/screens/loadingScreen.dart';

class Botao extends StatelessWidget {
  final String texto;
  final String field;

  const Botao({required this.texto, required this.field, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoadingScreen(field:field)),
        );
      },
      child: Text(
        texto,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}