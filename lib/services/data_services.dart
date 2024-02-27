import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle ;
import 'package:http/http.dart' as http;
import '../model/data_model.dart';

class Dataservices {
  String baseUrl = 'http://127.0.0.1:8000/api/';
  Future<List<DataModel>> getUsers() async {
  var apiUrl = 'billinfo';
  http.Response response = await http.get(
    Uri.parse(baseUrl+apiUrl));

try{
  if(response.statusCode==200)
  {
    List<dynamic> list = await json.decode(response.body);
    print(list);
    return list.map((e) =>new DataModel.fromjson(e)).toList();
  }
  else{
    print('somthing is wrong');

    return <DataModel>[];
    }
}
catch (e) {
  print('shit didnt even work');
  return <DataModel>[];
}


  /* var info = rootBundle.loadString("json/file.json");
   List<dynamic> list = json.decode(await info);
  return Future.delayed(Duration(seconds: 5),()=> list.map((e) => e).toList());*/

 }
}