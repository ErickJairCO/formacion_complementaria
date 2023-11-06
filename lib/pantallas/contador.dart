import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  @override
  State<Contador> createState() => _Contador();
}

class _Contador extends State<Contador>{

  Widget crearTabla(){
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
              child: Text('Nombre', style: TextStyle(fontStyle: FontStyle.italic),),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text('Actividad', style: TextStyle(fontStyle: FontStyle.italic),),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text('Horas', style: TextStyle(fontStyle: FontStyle.italic),),
          ),
        )
      ],
      rows: <DataRow>[
        DataRow(
            cells: <DataCell>[
              DataCell(Text('Cultural')),
              DataCell(Text('Danza')),
              DataCell(Text('90')),
            ]
        ),
        DataRow(
            cells: <DataCell>[
              DataCell(Text('Deportiva')),
              DataCell(Text('Fultbol')),
              DataCell(Text('90')),
            ]
        ),
        DataRow(
            cells: <DataCell>[
              DataCell(Text('Conferencia')),
              DataCell(Text('Cisco y tecnologias de la informacion')),
              DataCell(Text('20')),
            ]
        ),
        DataRow(
            cells: <DataCell>[
              DataCell(Text('Intersemestral')),
              DataCell(Text('Introduccion a Python')),
              DataCell(Text('40')),
            ]
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resumen de horas'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          crearTabla(),
          Text('Horas totales: 180', style: const TextStyle(fontSize: 40)),
        ],
      ),
    );
  }
}