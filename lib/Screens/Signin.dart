import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rotomotive/Screens/Home.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String name, email, pass;
  bool processing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 200, width: 200, child: Icon(Icons.account_circle, size: 200,),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: "Enter Email"),
                      onChanged: (value) {email = value;},
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Enter Password"),
                      onChanged: (value) {pass = value;},
                    ),
                    SizedBox(height: 15),
                    MaterialButton(
                      onPressed: () => loginUser(),
                      child: processing ? CircularProgressIndicator(backgroundColor: Colors.red,) : Text("Sign In", style: TextStyle(color: Colors.blue, fontSize: 20),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginUser() async {
    setState(() {
      processing = true;
    });

    var url = "https://fluttermysqlphp.000webhostapp.com/signin.php";
    var data = {
      "email": email,
      "pass": pass,
    };
    var res = await http.post(url, body:data);

    if(jsonDecode(res.body) == "dont have account") {
      Fluttertoast.showToast(msg: "Create Account");
    } 
    if(jsonDecode(res.body) == "False") {
        Fluttertoast.showToast(msg: "incorrect password", toastLength: Toast.LENGTH_LONG);
      } else if(jsonDecode(res.body) == "True") {
        Fluttertoast.showToast(msg: "Success", toastLength: Toast.LENGTH_LONG);
        Navigator.pushNamed(context, Home.id);
      }

    setState(() {
      processing = false;
    });
  }
}