import 'package:flutter/material.dart';
import 'package:rotomotive/Components/RaisedBtn.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  String grnNo = 'Select';
  String itemNo = 'Select';
  @override
  Widget build(BuildContext context) {
    return Column(
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
            kRaisedButton("Download Report", (){}),
          ],
        ),
      ],
    );
  }
}