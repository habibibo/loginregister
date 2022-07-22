import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:teskoffie/main.dart';
import '../form/form.dart';

class Login extends StatefulWidget{

  @override
  State<Login> createState() => MyLoginSate();
  
}

class MyLoginSate extends State<Login>{

@override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
        centerTitle: true,
      ),
      body: LoginForm().buildForm(context)
    );
  }
}