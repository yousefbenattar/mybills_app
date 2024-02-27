import 'package:flutter/foundation.dart';

class DataModel {
  String brand_name;
  String brand_logo;
  int status;
  String due_info;
  int due;
  int id ;
  DataModel(
      {
        required this.id,
        required this.brand_name,
      required this.brand_logo,
      required this.status,
      required this.due_info,
      required this.due});
  factory DataModel.fromjson(Map <String,dynamic> json) => DataModel(
      brand_name:json["brand_name"] ,
      brand_logo:json["brand_logo"] ,
      status:json["status"] ,
      due_info:json["due_info"] ,
      due:json["due"] ,
      id:json["brand_id"]
      );
}
