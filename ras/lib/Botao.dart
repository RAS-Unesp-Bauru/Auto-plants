import 'package:flutter/material.dart';
import 'package:ras/screens/loadingScreen.dart';

// TODO: Classe botao faz mais de uma funcao -> refatorar para receber a funcao do clique por parametro

class Botao extends StatelessWidget {
  final String texto;
  final int id;

  const Botao({required this.id, required this.texto, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
      onPressed: () {
        Navigator.pushNamed(
          context,
          '/LS',
          arguments: id,
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
