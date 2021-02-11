import 'package:flutter/material.dart';
import 'package:rotomotive/Components/RaisedBtn.dart';
import 'package:rotomotive/Components/TextField.dart';

class Approval extends StatefulWidget {
  @override
  _ApprovalState createState() => _ApprovalState();
}

class _ApprovalState extends State<Approval> {
  String conclusion, accept, acceptUnderDev, reject;
  String grnNo = 'Select';
  String itemNo = 'Select';
  final List<Map<String, String>> data = [
    {"Characteristics": "char1", "Specification": "14j6", "Tolerance": "14", "Remark": "+0.008", "Average": "-0.003", "Std. Dev": "14", "Minimum": "+0.008", "Maximum": "-0.003"},
    {"Characteristics": "char1", "Specification": "14j6", "Tolerance": "14", "Remark": "+0.008", "Average": "-0.003", "Std. Dev": "14", "Minimum": "+0.008", "Maximum": "-0.003"},
    {"Characteristics": "char1", "Specification": "14j6", "Tolerance": "14", "Remark": "+0.008", "Average": "-0.003", "Std. Dev": "14", "Minimum": "+0.008", "Maximum": "-0.003"},
    {"Characteristics": "char1", "Specification": "14j6", "Tolerance": "14", "Remark": "+0.008", "Average": "-0.003", "Std. Dev": "14", "Minimum": "+0.008", "Maximum": "-0.003"},
    {"Characteristics": "char1", "Specification": "14j6", "Tolerance": "14", "Remark": "+0.008", "Average": "-0.003", "Std. Dev": "14", "Minimum": "+0.008", "Maximum": "-0.003"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("GRN No.: "),
              DropdownButton<String>(
                value: grnNo,
                onChanged: (String newValue) {
                  setState(() {
                    grnNo = newValue;
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
              Text("Item No.: "),
              DropdownButton<String>(
                value: itemNo,
                onChanged: (String newValue) {
                  setState(() {
                    itemNo = newValue;
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
              kRaisedButton("Download Report", (){}),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 25,
              headingRowHeight: 50,
              dataRowHeight: 75,
              columns: [
                DataColumn(label: Text("Characteristics", style: Theme.of(context).textTheme.subtitle2, textAlign: TextAlign.center,)),
                DataColumn(label: Text("Specification", style: Theme.of(context).textTheme.subtitle2,), numeric: true),
                DataColumn(label: Text("Tolerance", style: Theme.of(context).textTheme.subtitle2,)),
                DataColumn(label: Text("Remark", style: Theme.of(context).textTheme.subtitle2,)),
                DataColumn(label: Text("Average", style: Theme.of(context).textTheme.subtitle2,)),
                DataColumn(label: Text("Std. Dev", style: Theme.of(context).textTheme.subtitle2,)),
                DataColumn(label: Text("Minimun", style: Theme.of(context).textTheme.subtitle2,)),
                DataColumn(label: Text("Maximum", style: Theme.of(context).textTheme.subtitle2,)),
              ],
              rows: data.map(
                ((element) => DataRow(
                    cells: <DataCell>[
                      DataCell(Center(child: Text(element["Characteristics"],))),
                      DataCell(Center(child: Text(element["Specification"],))),
                      DataCell(Center(child: Text(element["Tolerance"],))),
                      DataCell(Center(child: Text(element["Remark"],))),
                      DataCell(Center(child: Text(element["Average"],))),
                      DataCell(Center(child: Text(element["Std. Dev"],))),
                      DataCell(Center(child: Text(element["Minimum"],))),
                      DataCell(Center(child: Text(element["Maximum"],))),
                    ],
                  )
                ),
              ).toList(),
            ),
          ),
          Row(
            children: [
              Expanded(child: kTextField("Conclusion", TextInputType.text, (value){conclusion = value;})),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Text(accept ?? "0", style: TextStyle(backgroundColor: Colors.greenAccent, color: Colors.white, fontWeight: FontWeight.w900),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Text(acceptUnderDev ?? "0", style: TextStyle(backgroundColor: Colors.blueAccent, color: Colors.white, fontWeight: FontWeight.w900),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Text(reject ?? "0", style: TextStyle(backgroundColor: Colors.redAccent, color: Colors.white, fontWeight: FontWeight.w900),),
              ),
              kRaisedButton("Accept", (){}, Colors.greenAccent[400]),
              kRaisedButton("Reject", (){}, Colors.redAccent[400]),
            ],
          ),
        ],
      ),
    );
  }
}