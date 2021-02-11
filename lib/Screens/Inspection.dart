import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:rotomotive/Components/DataCell.dart';
import 'package:rotomotive/Components/RaisedBtn.dart';

class Inspection extends StatefulWidget {
  @override
  _InspectionState createState() => _InspectionState();
}

class _InspectionState extends State<Inspection> {
  int inspectionNo;
  final List<Map<String, String>> data = [
    {"Characteristics": "char1", "Specification": "14j6", "Tolerance": "14", "Measured Dimensions 1": "+0.008", "Measured Dimensions 2": "-0.003", "Measured Dimensions 3": "14", "Measured Dimensions 4": "+0.008", "Measured Dimensions 5": "-0.003"},
    {"Characteristics": "char1", "Specification": "14j6", "Tolerance": "14", "Measured Dimensions 1": "+0.008", "Measured Dimensions 2": "-0.003", "Measured Dimensions 3": "14", "Measured Dimensions 4": "+0.008", "Measured Dimensions 5": "-0.003"},
    {"Characteristics": "char1", "Specification": "14j6", "Tolerance": "14", "Measured Dimensions 1": "+0.008", "Measured Dimensions 2": "-0.003", "Measured Dimensions 3": "14", "Measured Dimensions 4": "+0.008", "Measured Dimensions 5": "-0.003"},
    {"Characteristics": "char1", "Specification": "14j6", "Tolerance": "14", "Measured Dimensions 1": "+0.008", "Measured Dimensions 2": "-0.003", "Measured Dimensions 3": "14", "Measured Dimensions 4": "+0.008", "Measured Dimensions 5": "-0.003"},
    {"Characteristics": "char1", "Specification": "14j6", "Tolerance": "14", "Measured Dimensions 1": "+0.008", "Measured Dimensions 2": "-0.003", "Measured Dimensions 3": "14", "Measured Dimensions 4": "+0.008", "Measured Dimensions 5": "-0.003"},
  ];

  @override
  Widget build(BuildContext context) {
    String grnNo = 'Select';
    String itemNo = 'Select';
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Welcome Inspector"),
            Text("ROTOMAG"),
            FlatButton(
              onPressed: () {},
              child: Text("Logout"),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                kRaisedButton("Get Parameters", (){}),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: DataTable(
                    columnSpacing: 25,
                    headingRowHeight: 50,
                    dataRowHeight: 75,
                    columns: [
                      DataColumn(label: Text("Characteristics", style: Theme.of(context).textTheme.subtitle2, textAlign: TextAlign.center,)),
                      DataColumn(label: Text("Specification", style: Theme.of(context).textTheme.subtitle2,), numeric: true),
                      DataColumn(label: Text("Tolerance", style: Theme.of(context).textTheme.subtitle2,)),
                    ],
                    rows: data.map(
                      ((element) => DataRow(
                          cells: <DataCell>[
                            DataCell(Center(child: Text(element["Characteristics"],))),
                            DataCell(Center(child: Text(element["Specification"],))),
                            DataCell(Center(child: Text(element["Tolerance"],))),
                          ],
                        )
                      ),
                    ).toList(),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Text("Dimension 1", style: Theme.of(context).textTheme.subtitle2, textAlign: TextAlign.center),
                              Text("Dimension 2", style: Theme.of(context).textTheme.subtitle2, textAlign: TextAlign.center),
                              Text("Dimension 3", style: Theme.of(context).textTheme.subtitle2, textAlign: TextAlign.center),
                              Text("Dimension 4", style: Theme.of(context).textTheme.subtitle2, textAlign: TextAlign.center),
                              Text("Dimension 5", style: Theme.of(context).textTheme.subtitle2, textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                        // Expanded(flex: 1, child: Container(width: 100, height: 75, child: element())),
                      ],
                    ),
                  ),
                ),
                // Expanded(flex: 1, child: FlatButton(onPressed: () {}, child: Icon(Icons.skip_previous, size: MediaQuery.of(context).size.width*0.1,))),
                // Expanded(flex: 1, child: FlatButton(onPressed: () {}, child: Icon(Icons.skip_next, size: MediaQuery.of(context).size.width*0.1,))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                kRaisedButton("Save", (){}),
                kRaisedButton("Submit", (){}, Colors.greenAccent[400]),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget element() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: inspectionNo ?? 1,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 150,
            child: NumberInputWithIncrementDecrement(
              controller: TextEditingController(),
              numberFieldDecoration: InputDecoration(
                border: InputBorder.none,
              ),
              widgetContainerDecoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10)
                ),
                border: Border.all(
                  color: Colors.black,
                )
              ),
              incIconDecoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(8),
                ),
              ),
              decIconDecoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(8),
                ),
              ),
              separateIcons: true,
              incIcon: Icons.add,
              decIcon: Icons.remove,
              incIconColor: Colors.white,
              decIconColor: Colors.white,
              incIconSize: 30,
              decIconSize: 30,
              isInt: false,
              fractionDigits: 3,
              incDecFactor: 0.001,
              initialValue: 0,
            ),
          );
        },
      ),
    );
  }
}