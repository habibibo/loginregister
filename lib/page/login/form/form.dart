import 'package:flutter/material.dart';
import 'package:teskoffie/page/register/view/register.dart';
import '../controller/controller.dart';

class LoginForm{
  

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void getLogin(context){
    var data = {
      "username" : username.text,
      "password" : password.text
    };
    LoginController().getLogin(data,context);
  }

  Widget buildForm(context){
    return Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: username,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Username',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    labelText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                MaterialButton(
                  color: Colors.green,
                  child: Text("Login", style: TextStyle(
                    color: Colors.white
                  ),),
                  minWidth: double.infinity,
                  onPressed: (){
                    getLogin(context);
                }),
                MaterialButton(
                  color: Colors.blue,
                  child: Text("Register", style: TextStyle(
                    color: Colors.white
                  ),),
                  minWidth: double.infinity,
                  onPressed: (){
                    Navigator.pushReplacement<void, void>(
                      context, MaterialPageRoute<void>(builder: ((context) 
                      => Register() ))
                      );
                }),
              ],
            ),
          ),
        ),
      );
  }


}