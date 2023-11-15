import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:teste/services/com.dart';
import 'tabelaScreen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({required this.field, Key? key}) : super(key: key);

  final String field;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<List<dynamic>> aux = [];

  @override
  void initState() {
    super.initState();
    query();
  }

  void query() async {
    aux = await API().getReq(widget.field);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TabelaScreen(sensorData:aux, field: widget.field)),
    );
  }

  @override
  Widget build(BuildContext context) {
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
