import 'package:flutter/material.dart';

class TabelaScreen extends StatefulWidget {
  const TabelaScreen({required this.sensorData, required this.field, Key? key}) : super(key: key);

  final List<List<dynamic>> sensorData;
  final field;
  
  @override
  State<TabelaScreen> createState() => _TabelaPageState();
}

class _TabelaPageState extends State<TabelaScreen> {
  List<List<dynamic>> tableData = [];

  @override
  void initState() {
    super.initState();

    updateUI(widget.sensorData);
  }

  void updateUI(List<List<dynamic>> sensorData) {
    for (int i = 0; i < sensorData.length; i++) {
      addNewRow(sensorData[i]);
    }
  }

  void addNewRow(List<dynamic> rowData) {
    setState(() {
      tableData.add(rowData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dados do sensor'),
        ),
        body: Center(
          child: ListView(
            children: [
              DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                      label: Text(
                    'T',
                  )),
                  DataColumn(
                      label: Text(
                    'H',
                  )),
                  DataColumn(
                      label: Text(
                    'Time',
                  )),
                ],
                rows:
                tableData.map((rowData) {
                  return DataRow(
                    cells: rowData.map((cellData) {
                      return DataCell(Text(cellData.toString()));
                    }).toList(),
                  );
                }).toList(),
              ),
            ],
          ),
        ));
  }
}
