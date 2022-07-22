import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:teskoffie/main.dart';
import 'package:intl/intl.dart';
import 'package:teskoffie/page/login/view/login.dart';
import 'dart:io';
import '../../register/form/form.dart';
import '../controller/controller.dart';

class Register extends StatefulWidget{
  @override
  State<Register> createState() => MyRegisterSate();
}

class MyRegisterSate extends State<Register>{
//TextEditingController tgl_lahir = TextEditingController()



  TextEditingController email = TextEditingController();
  TextEditingController hp = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController grup = TextEditingController();
  TextEditingController role = TextEditingController();
  TextEditingController tgl_lahir = TextEditingController();
  TextEditingController jenis_kelamin = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController strict_password = TextEditingController();
  TextEditingController referral_code = TextEditingController();
  String genderSelect = 'Laki - laki';
  String grupSelect = 'UA';
  late int gender;
void createUser(context){

  if(genderSelect == 'Laki - laki'){
    gender = 1;
  }else{
    gender = 2;
  }
  
  Map data = {    
      "email": email.text,
      "hp": hp.text,
      "firstname": firstname.text,
      "lastname": lastname.text,
      "grup": grupSelect.toLowerCase(),
      "role": role.text,
      "tgl_lahir": tgl_lahir.text,
      "jenis_kelamin": gender,
      "password": password.text,
      "strict_password": "false",
      "referral_code": referral_code.text
    };
    if(email.text == ""){
      SweetAlert.show(context,
        title: "Gagal",
        subtitle: "Harap isi email",
        style: SweetAlertStyle.error
      );
    }else if(hp.text == ""){
      SweetAlert.show(context,
        title: "Gagal",
        subtitle: "Harap isi nomor handphone",
        style: SweetAlertStyle.error
      );
    }else if(firstname.text == ""){
      SweetAlert.show(context,
        title: "Gagal",
        subtitle: "Harap isi nama awal",
        style: SweetAlertStyle.error
      );
    }else if(lastname.text == ""){
      SweetAlert.show(context,
        title: "Gagal",
        subtitle: "Harap isi nama akhir",
        style: SweetAlertStyle.error
      );
    }else if(tgl_lahir.text == ""){
      SweetAlert.show(context,
        title: "Gagal",
        subtitle: "Harap isi tanggal lahir",
        style: SweetAlertStyle.error
      );
    }else if(password.text == ""){
      SweetAlert.show(context,
        title: "Gagal",
        subtitle: "Harap isi password",
        style: SweetAlertStyle.error
      );
    }else {
      RegisterController().createUser(data, context);
    }
}


// widget

Widget inputEmail(){
  return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                ),
                  focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            controller: email,
          );
}

Widget inputHp(){
  return TextField(
            keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone_android),
                labelText: 'Handphone',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            controller: hp,
          );
}

Widget inputFirstname(){
  return TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.card_membership),
            labelText: 'Nama Awal',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          controller: firstname,
        );
}

Widget inputLastname(){
 return TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.card_membership),
            labelText: 'Nama Akhir',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        controller: lastname,
      );
}

Widget inputGroup(){
  return Container(
            padding: EdgeInsets.all(10),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Icon(Icons.card_membership, color: Colors.grey,),
          SizedBox(width: 15,),
            DropdownButton<String>(
              value: grupSelect,
              elevation: 16,
              style: const TextStyle(color: Colors.blue),
              underline: Container(
                width: double.infinity,
                height: 2,
                color: Colors.blue,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  grupSelect = newValue!;
                });
              },
              items: <String>['UA', 'Member', 'Mitra']
              .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
              }).toList(),
              ),
           ],
          ),
      );
}

Widget inputRole(){
  return TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.list),
              labelText: 'Role',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.blue),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.blue),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            controller: role,
          );
}

Widget inputBirth(){
  return TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.calendar_month),
            labelText: 'Tanggal Lahir',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          controller: tgl_lahir,
          readOnly: true, 
          onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context, initialDate: DateTime.now(),
                  firstDate: DateTime(1980), 
                  lastDate: DateTime(2101)
                );
                      
                if(pickedDate != null ){
                  print(pickedDate);  
                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                  print(formattedDate); 
                            
                  setState(() {
                    tgl_lahir.text = formattedDate; 
                  });
                }else{
                  print("Tanggal belum dipilih");
                }
              },
          );
}

Widget inputGender(){
  return Container(
            padding: EdgeInsets.all(10),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Icon(Icons.card_membership, color: Colors.grey,),
          SizedBox(width: 15,),
            DropdownButton<String>(
              value: genderSelect,
              elevation: 16,
              style: const TextStyle(color: Colors.blue),
              underline: Container(
                width: double.infinity,
                height: 2,
                color: Colors.blue,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  genderSelect = newValue!;
                });
              },
              items: <String>['Laki - laki', 'Perempuan']
              .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
              }).toList(),
              ),
           ],
          ),
      );
}

Widget inputPassword(){
  return TextField(
          obscureText: true,
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
          controller: password,
        );
}

Widget inputReferal(){
  return TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.code_sharp),
            labelText: 'Kode Referal',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          controller: referral_code,
        );
}

Widget buttonRegister(){
  return MaterialButton(
          child: Text("Register", style: TextStyle(color: Colors.white),),
            color: Colors.blue,
            minWidth: double.infinity,
            onPressed: (){
              createUser(context);
            });
}

Widget buttonLogin(){
  return MaterialButton(
          minWidth: double.infinity,
          color: Colors.green,
            child: Text("Login"),
            onPressed: (){
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => Login(),
                ),
              );
          });
}

@override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  inputEmail(),
                  SizedBox(height: 10,),
                  inputHp(),
                  SizedBox(height: 10,),
                  inputFirstname(),
                  SizedBox(height: 10,),
                  inputLastname(),
                  SizedBox(height: 10,),
                  inputGroup(),
                  SizedBox(height: 10,),
                  inputRole(),
                  SizedBox(height: 10,),
                  inputBirth(),
                  SizedBox(height: 10,),
                  inputGender(),
                  SizedBox(height: 10,),
                  inputPassword(),
                  SizedBox(height: 10,),
                  inputReferal(),
                  SizedBox(height: 20,),
                  buttonRegister(),
                  SizedBox(height: 10,),
                  buttonLogin(),
                ],
              ),
        ),
      ),
    );
  }
}