import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:rotomotive/Components/RaisedBtn.dart';
import 'package:rotomotive/Components/TextField.dart';

class EnterItem extends StatefulWidget {
  @override
  _EnterItemState createState() => _EnterItemState();
}

class _EnterItemState extends State<EnterItem> {
  String grnNo = 'Select', itemNo = "", suppName = "", itemDesc = "", partName = "", partNo = "", desRev = "", vendorName = "";
  int invNo = 0, bQty = 0, tQty = 0, insQty = 0;
  DateTime grnDate = DateTime.now();
  String _scanBarcode = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        dataCustom("GRN No.", kTextField("Scan or Write GRN No.", TextInputType.text, (value){grnNo = value;}), "Scan", (){scan();}),
        dataCustom("Item No.", DropdownButton<String>(
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
            }).toList(),
        ), "Fetch", (){}),
        dataT("Supp. Name", suppName),
        dataT("Item Desc.", itemDesc),
        dataT("Inv. No", invNo.toString()),
        dataT("GRN Date", grnDate.toString()),
        dataT("B. Qty.", bQty.toString()),
        dataTF("T. Qty.", tQty.toString(), TextInputType.number, (value){tQty = value;}),
        dataT("Part Name", partName),
        dataT("Part No.", partNo),
        Row(
          children: [
            Expanded(flex: 1, child: Text("Design Rev.")),
            Expanded(flex: 2, child: DropdownButton<String>(
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
              ),),
          ],
        ),
        dataT("Vendor Name", vendorName),
        dataTF("Inspection Qty.", insQty.toString(), TextInputType.number, (value){insQty = value;}),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            kRaisedButton("Cancel", (){}, Colors.redAccent[400]),
            kRaisedButton("Submit", (){}, Colors.greenAccent[400]),
          ],
        ),
      ],
    );
  }

  Widget dataCustom(String dataName, Widget widget, String action, Function onAction) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(dataName)),
        Expanded(flex: 2, child: widget),
        Expanded(flex: 1, child: kRaisedButton(action, onAction)),
      ],
    );
  }

  Widget dataTF(String dataName, String value, TextInputType textInputType, Function onChange) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(dataName)),
        Expanded(flex: 2, child: Expanded(child: kTextField(value, textInputType, onChange))),
      ],
    );
  }

  Widget dataT(String dataName, String value) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(dataName)),
        Expanded(flex: 2, child: Text(value)),
      ],
    );
  }

  // Future scan() async {
  //   try {
  //     // String grnNo = await BarcodeScanner.scan();
  //     setState(() {
  //       this.grnNo = grnNo;
  //     });
  //   } on PlatformException catch(e) {
  //     if(e.code == BarcodeScanner.cameraAccessDenied) {
  //       setState(() {
  //         this.grnNo = "Camera permission not granted";
  //       });
  //     } else {
  //       setState(() {
  //         this.grnNo = "Error!";
  //       });
  //     }
  //   } on FormatException {
  //     setState(() {
  //       this.grnNo = "Cancelled";
  //     });
  //   } catch(e) {
  //     setState(() {
  //       this.grnNo = "Error!";
  //     });
  //   }
  // }

  Future<void> scan() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
}