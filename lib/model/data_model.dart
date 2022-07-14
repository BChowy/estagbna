// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.category,
  });

  List<Category> category;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.cateid,
    required this.name,
    required this.info,
  });

  int cateid;
  String name;
  List<Info> info;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        cateid: json["cateid"],
        name: json["name"],
        info: List<Info>.from(json["info"].map((x) => Info.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cateid": cateid,
        "name": name,
        "info": List<dynamic>.from(info.map((x) => x.toJson())),
      };
}

class Info {
  Info({
    required this.id,
    required this.desc,
  });

  int id;
  String desc;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json["id"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "desc": desc,
      };
}
