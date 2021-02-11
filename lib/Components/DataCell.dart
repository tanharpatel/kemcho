import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

DataCell mesdim(Map<String, String> element) {
  // String val = element["Specified Dimensions"].substring(0, 2) + element["PTolerance"].substring(2);
  // double measureddim = double.parse(val);
  return DataCell(
    SizedBox(
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
    ),
  );
}