import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DataCell Color Example'),
        ),
        body: Center(
          child: DataTable(
            columns: <DataColumn>[
              DataColumn(
                label: Text('Name'),
              ),
              DataColumn(
                label: Text('Age'),
              ),
            ],
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Container(
                      color: Colors.blue, // Set your desired color here
                      child: Text('John'),
                    ),
                  ),
                  DataCell(
                    Text('30'),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Container(
                      color: Colors.green, // Set your desired color here
                      child: Text('Alice'),
                    ),
                  ),
                  DataCell(
                    Text('25'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
