import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweetalert/sweetalert.dart';
import '../../../api/url.dart';

class Dashboard extends StatefulWidget{

  @override
  State<Dashboard> createState() => MyDashboardSate();
  
}

class MyDashboardSate extends State<Dashboard>{

Future<List<dynamic>> _fecthDataUsers() async {
    final shared = await SharedPreferences.getInstance();
    var getToken = shared.getString("gettoken");
    final url = getUrl().url;
    final result = await http.get(
                    headers: {
                      'Content-Type': 'application/json',
                      'Accept': 'application/json',
                      'Authorization': 'Bearer $getToken',
                    },
                    Uri.parse("$url/users/daftar")
                    );
    return json.decode(result.body)['data'];
  }


@override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.person),
                      ),
                      title: Text(snapshot.data[index]['email'] + " - " + snapshot.data[index]['firstname']),
                      subtitle: Text(snapshot.data[index]['hp']),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}