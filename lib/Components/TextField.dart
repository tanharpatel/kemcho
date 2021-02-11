import 'package:flutter/material.dart';

Widget kTextField(String labeltext, TextInputType keyboardType, Function onChanged) {
  return TextField(
    onChanged: onChanged,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      labelText: labeltext,
      labelStyle: TextStyle(color: Colors.black),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[600], width: 2),
        // borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}