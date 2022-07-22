import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sweetalert/sweetalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../dashboard/view/dashboard.dart';
import '../../../api/url.dart';


class LoginController {
  String gettoken = "";

  void getLogin(data, context)async{
      final shared = await SharedPreferences.getInstance();
      final url = getUrl().url;
      var request = new 
      http.MultipartRequest("POST",Uri.parse("$url/login"));
      if(data["username"] == ""){
        SweetAlert.show(context,
                      title: "Gagal",
                      subtitle: "Harap isi username",
                      style: SweetAlertStyle.error
                    );
      }else if(data["password"] == ""){
        SweetAlert.show(context,
                      title: "Gagal",
                      subtitle: "Harap isi password",
                      style: SweetAlertStyle.error
                    );
      }else{
        request.fields['username'] = data["username"];
        request.fields['password'] = data["password"]; 
        http.Response response = await http.Response.fromStream(await 
        request.send());
        var message = json.decode(response.body);
        if(message["status"]["kode"] == "success"){
          SweetAlert.show(context,
                      title: "Berhasil",
                      style: SweetAlertStyle.success
                    );

        shared.setString("gettoken", message["access_token"]);
        
        Navigator.pushReplacement<void, void>(
          context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => Dashboard(),
            ),
        );

        }else{
          SweetAlert.show(context,
                      title: "GAGAL",
                      subtitle: message["status"]["keterangan"],
                      style: SweetAlertStyle.error
                    );
        }
        debugPrint(message["access_token"]);
      }
      
      
  }


}