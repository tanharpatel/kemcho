import 'package:flutter/material.dart';
import 'package:rotomotive/Screens/Home.dart';
import 'package:rotomotive/Screens/Inspection.dart';
import 'package:rotomotive/Screens/Signin.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Rotomotive",
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      },
    ),
  );
}