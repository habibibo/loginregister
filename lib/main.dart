import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teskoffie/page/login/view/login.dart';
import 'page/register/view/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tes Koffie Soft',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tes Koffie Soft'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(

          child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius : 50,
                child: Icon(Icons.coffee, size: 60,color: Colors.brown,),
              ),
              SizedBox(height: 10,),
              Text("Silahkan Register jika belum mempunyai akun"),
              SizedBox(height: 10,),
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.blue,
                child: Text("Register", style: TextStyle(color: Colors.white),),
                onPressed: (){
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Register(),
                    ),
                  );
              }),

              SizedBox(height:5),
              MaterialButton(
                minWidth: double.infinity,
                color: Colors.green,
                child: Text("Login", style: TextStyle(color: Colors.white),),
                onPressed: (){
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Login(),
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
