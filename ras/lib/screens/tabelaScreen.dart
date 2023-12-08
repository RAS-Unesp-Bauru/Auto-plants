import 'package:flutter/material.dart';
import 'package:ras/screens/loadingScreen.dart';

class TabelaScreen extends StatefulWidget {
  const TabelaScreen({Key? key})
      : super(key: key);

  @override
  State<TabelaScreen> createState() => _TabelaPageState();
}

class _TabelaPageState extends State<TabelaScreen> {
  List<List<dynamic>> tableData = [];
  List<DataColumn> columns = [];

  void updateUI(args) {
    addNewColumn(args[0][0]);
    print(args.length);
    if (args == null) {
      print('Nao foi possivel receber os dados');
    } else {
      for (int i = 1; i < args.length - 70000; i++) {
        addNewRow(args[i]);
      }
    }
  }

  void addNewColumn(int id) {
    setState(() {
      if (id == 1) {
        columns.add(DataColumn(label: Text('Temperatura')));
      } else if (id == 2) {
        columns.add(DataColumn(label: Text('Humidade')));
      }
      columns.add(const DataColumn(label: Text('Tempo')));
    });
  }

  void addNewRow(List<dynamic> rowData) {
    setState(() {
      tableData.add(rowData);
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    updateUI(args);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados do sensor'),
      ),
      body: Center(
        child: ListView(
          children: [
            DataTable(
              columns: columns,
              rows: tableData.map((rowData) {
                return DataRow(
                  cells: rowData.map((cellData) {
                    return DataCell(Text(cellData.toString()));
                  }).toList(),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
