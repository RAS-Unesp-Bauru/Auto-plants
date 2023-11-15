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
  List<DataColumn> columns = [];

  @override
  void initState() {
    super.initState();

    updateUI(widget.sensorData);
  }

  void updateUI(List<List<dynamic>> sensorData) {
    addNewColumn(widget.field);
    for (int i = 0; i < sensorData.length; i++) {
      addNewRow(sensorData[i]);
    }
  }

  void addNewColumn(ColumnName) {
    setState(() {
      columns.add(DataColumn(
        label: Text(
          ColumnName
        )
      ))
      columns.add(DataColumn(
        label: Text(
          Time
        )
      ))
    });
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
                columns: columns
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
