import 'package:flutter/material.dart';
import 'package:rotomotive/Components/DataCell.dart';
import 'package:rotomotive/Components/TextField.dart';

class HomeOld extends StatefulWidget {
  static final String id = "HomeOld";
  @override
  _HomeOldState createState() => _HomeOldState();
}

class _HomeOldState extends State<HomeOld> {

  List<String> colName = ["Sr. No", "Specified Dimensions", "Tolerance", "Measured Dimensions"];
  final List<Map<String, String>> listOfColumns = [
    {"Specified Dimensions": "14j6", "PTolerance": "+0.008", "NTolerance": "-0.003"},
    {"Specified Dimensions": "15k5", "PTolerance": "+0.009", "NTolerance": "+0.001"},
    {"Specified Dimensions": "17t7", "PTolerance": "+0.051", "NTolerance": "+0.033"},
  ];
  double measureddim;
  String specdim, ptol, ntol, conclusion, inspectedBy, approvedBy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rotomotive Powerdrives"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          listOfColumns.add({"Specified Dimensions": "$specdim", "PTolerance": "$ptol", "STolerance": "$ntol"});
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(color: Colors.grey[600], thickness: 2,),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text("Rotomotive Powerdrives India Ltd.".toUpperCase(), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w900),),
                      Text("Inseption Report".toUpperCase(), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.grey[600], width: 2,),)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(flex: 1, child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Text("No.:"),
                            ),),
                            Expanded(flex: 2, child: Text("F /Q /7")),
                          ],
                        ),
                        Divider(color: Colors.grey[600], thickness: 2,),
                        Row(
                          children: [
                            Expanded(flex: 1, child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Text("Rev.:"),
                            ),),
                            Expanded(flex: 2, child: Text("01/01.08.2017")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey[600], thickness: 2,),
            Row(
              children: [
                Expanded(child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(flex: 2, child: Text("INV NO.:"),),
                            Expanded(flex: 3, child: Text("1206")),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(flex: 2, child: Text("DATE:"),),
                              Expanded(flex: 3, child: Text("30/01/2020")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(flex: 2, child: Text("PART NAME:"),),
                              Expanded(flex: 3, child: Text("Rotor Shaft BM71")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(flex: 2, child: Text("PART NO:"),),
                              Expanded(flex: 3, child: Text("4-1837-54-B71-4676")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
                Expanded(child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(flex: 2, child: Text("GRN NO.:"),),
                            Expanded(flex: 3, child: Text("1206")),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(flex: 2, child: Text("REPORT NO:"),),
                              Expanded(flex: 3, child: Text("30/01/2020")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(flex: 2, child: Text("BATCH QTY:"),),
                              Expanded(flex: 3, child: Text("Rotor Shaft BM71")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(flex: 2, child: Text("INSP. QTY:"),),
                              Expanded(flex: 3, child: Text("4-1837-54-B71-4676")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
                Expanded(child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(flex: 2, child: Text("DATE.:"),),
                            Expanded(flex: 3, child: Text("1206")),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(flex: 2, child: Text("DATE:"),),
                              Expanded(flex: 3, child: Text("30/01/2020")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(flex: 2, child: Text("DRG REV:"),),
                              Expanded(flex: 3, child: Text("Rotor Shaft BM71")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(flex: 2, child: Text("VENDOR NAME:"),),
                              Expanded(flex: 3, child: Text("4-1837-54-B71-4676")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
              ],
            ),
            Divider(color: Colors.grey[600], thickness: 2,),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[600], width: 2),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 49,
                        color: Colors.white,
                        child: Text("Sr.\nNo",  style: Theme.of(context).textTheme.headline6,),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _srNo(3),
                      ),
                    ],
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 25,
                        headingRowHeight: 50,
                        dataRowHeight: 75,
                        columns: [
                          DataColumn(label: Text("Specified\nDimensions", style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center,)),
                          DataColumn(label: Text("Tolerance", style: Theme.of(context).textTheme.headline6,), numeric: true),
                          DataColumn(label: Text("Measured Dimensions 1", style: Theme.of(context).textTheme.headline6,)),
                          DataColumn(label: Text("Measured Dimensions 2", style: Theme.of(context).textTheme.headline6,)),
                          DataColumn(label: Text("Measured Dimensions 3", style: Theme.of(context).textTheme.headline6,)),
                        ],
                        rows:
                          listOfColumns
                          .map(
                            ((element) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Center(child: Text(element["Specified Dimensions"],))),
                                  DataCell(
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(element["PTolerance"]),
                                        Text(element["NTolerance"]),
                                      ],
                                    ),
                                  ),
                                  mesdim(element),
                                  mesdim(element),
                                  mesdim(element),
                                ],
                              )
                            ),
                          )
                          .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: kTextField("Conclusion and Recommendation", TextInputType.text, (value){conclusion = value;}),
            ),
            Divider(color: Colors.grey[600], thickness: 2,),
            Row(
              children: [
                Expanded(
                  child: kTextField("Inspected By:", TextInputType.text, (value){inspectedBy = value;}),
                ),
                Expanded(
                  child: kTextField("Approved By:", TextInputType.text, (value){approvedBy = value;}),
                ),
              ],
            ),
            Divider(color: Colors.grey[600], thickness: 2,),
          ],
        ),
      ),
    );
  }
  
  List<Widget> _srNo(int count) {
    return List.generate(
      count,
      (index) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey[350]),
          ),
        ),
        alignment: Alignment.center,
        width: 50,
        height: 75,
        child: Text("${index + 1}", style: Theme.of(context).textTheme.headline6,),
      ),
    );
  }
}