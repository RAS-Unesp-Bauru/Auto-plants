import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ras/services/com.dart';
import 'package:ras/Botao.dart';
import 'tabelaScreen.dart';

class LoadingScreen extends StatefulWidget {

  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<List<dynamic>> sensorData = [];

  void query(args) async {
    sensorData = await API().getReq(args);

    List<int> aux = [];
    aux.add(args);
    sensorData.insert(0, aux);

    Navigator.pushReplacementNamed(
      context,
      '/TS',
      arguments: sensorData,
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    print(args);
    query(args);

    return const Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.green,
          size: 100.0,
        ),
      ),
    );
  }
}
