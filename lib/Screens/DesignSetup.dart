import 'package:flutter/material.dart';
import 'package:rotomotive/Components/RaisedBtn.dart';
import 'package:rotomotive/Components/TextField.dart';

class DesignSetup extends StatefulWidget {
  @override
  _DesignSetupState createState() => _DesignSetupState();
}

class _DesignSetupState extends State<DesignSetup> {
  String revNo, specification, baseValue, pTolerance, nTolerance;
  String designSetup = 'Select';
  String characteristics = 'Select';

  final List<Map<String, String>> data = [
    {"Characteristics": "char1", "Specification": "14j6", "Base Value": "14", "P. Tolerance": "+0.008", "N. Tolerance": "-0.003"},
    {"Characteristics": "char2", "Specification": "14j6", "Base Value": "14", "P. Tolerance": "+0.008", "N. Tolerance": "-0.003"},
    {"Characteristics": "char3", "Specification": "14j6", "Base Value": "14", "P. Tolerance": "+0.008", "N. Tolerance": "-0.003"},
    {"Characteristics": "char4", "Specification": "14j6", "Base Value": "14", "P. Tolerance": "+0.008", "N. Tolerance": "-0.003"},
    {"Characteristics": "char5", "Specification": "14j6", "Base Value": "14", "P. Tolerance": "+0.008", "N. Tolerance": "-0.003"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text("Old Design Setup: ")),
                  Expanded(
                    child: 
                      DropdownButton<String>(
                      value: designSetup,
                      onChanged: (String newValue) {
                        setState(() {
                          designSetup = newValue;
                        });
                      },
                      items: <String>['Select']
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                        .toList(),
                    ),
                  ),
                  Expanded(child: kRaisedButton("Fetch", (){})),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text("Design Rev.: ")),
                  Expanded(child: kTextField("Rev. No", TextInputType.text, (value){revNo = value;}),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      value: characteristics,
                      onChanged: (String newValue) {
                        setState(() {
                          characteristics = newValue;
                        });
                      },
                      items: <String>['Select']
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                        .toList(),
                    ),
                  ),
                  Expanded(child: kTextField("Specifications", TextInputType.text, (value){specification = value;})),
                  Expanded(child: kTextField("Base Value", TextInputType.number, (value){baseValue = value;})),
                  Expanded(child: kTextField("P. Tolerance", TextInputType.number, (value){pTolerance = value;})),
                  Expanded(child: kTextField("N. Tolerance", TextInputType.number, (value){nTolerance = value;})),
                  kRaisedButton("ADD", (){}),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 25,
                  headingRowHeight: 50,
                  dataRowHeight: 50,
                  columns: [
                    DataColumn(label: Text("Characteristics", style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center,)),
                    DataColumn(label: Text("Specification", style: Theme.of(context).textTheme.headline6,), numeric: true),
                    DataColumn(label: Text("Base Value", style: Theme.of(context).textTheme.headline6,)),
                    DataColumn(label: Text("P. Tolerance", style: Theme.of(context).textTheme.headline6,)),
                    DataColumn(label: Text("N. Tolerance", style: Theme.of(context).textTheme.headline6,)),
                    DataColumn(label: Text("", style: Theme.of(context).textTheme.headline6,)),
                  ],
                  rows: data.map(
                    ((element) => DataRow(
                        cells: <DataCell>[
                          DataCell(Center(child: Text(element["Characteristics"],))),
                          DataCell(Center(child: Text(element["Specification"],))),
                          DataCell(Center(child: Text(element["Base Value"],))),
                          DataCell(Center(child: Text(element["P. Tolerance"],))),
                          DataCell(Center(child: Text(element["N. Tolerance"],))),
                          DataCell(Center(child: kRaisedButton("DELETE", (){}))),
                        ],
                      )
                    ),
                  ).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  kRaisedButton("Cancel", (){}, Colors.redAccent[400]),
                  kRaisedButton("Save", (){}),
                  kRaisedButton("Submit", (){}, Colors.green[400]),
                ],
              ),
            ],
        ),
      ),
    );
  }
}