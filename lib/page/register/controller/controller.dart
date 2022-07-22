import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sweetalert/sweetalert.dart';
import '../../../api/url.dart';


class RegisterController {
  
  void createUser(data,context)async{

    try{
      final url = getUrl().url;
      final uri = Uri.parse("$url/users");
      final sendToApi = http.post(uri,headers: 
              {"Content-Type": "application/json"},
              body: json.encode(data)
            );
            
      print("isi email : "+ data.toString());
      sendToApi.then((value){
        //debugPrint(value.body.toString());
        var response = json.decode(value.body);
         
          if(response["status"]["kode"] == "success"){
            SweetAlert.show(context,
                        title: "Berhasil",
                        subtitle: response["status"]["keterangan"].toString(),
                        style: SweetAlertStyle.success
                      );
          }else{
            SweetAlert.show(context,
                        title: "Gagal",
                        subtitle: response["status"]["keterangan"].toString(),
                        style: SweetAlertStyle.error
                      );
          }
          debugPrint(response.toString());
      });
    }catch(e){
      SweetAlert.show(context,
                      title: "Gagal",
                      subtitle: "Sistem error",
                      style: SweetAlertStyle.error
                    );
    }
    


  }



}