import 'package:flutter/material.dart';

Widget kRaisedButton (String text, Function onPressed, [Color color]) {
  return Center(
    child: SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: RaisedButton(
          focusElevation: 3,
          onPressed: onPressed,
          child: Text(text, style: TextStyle(color: Colors.white,),),
          elevation: 3,
          color: color ?? Colors.blueAccent[700],
          disabledColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
        ),
      ),
    ),
  );
}