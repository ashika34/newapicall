// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Usermodel> usermodelFromJson(String str) => List<Usermodel>.from(json.decode(str).map((x) => Usermodel.fromJson(x)));

String usermodelToJson(List<Usermodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usermodel {
    int userId;
    int id;
    String title;
    String body;

    Usermodel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
