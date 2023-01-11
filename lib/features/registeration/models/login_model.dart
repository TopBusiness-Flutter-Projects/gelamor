// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

import 'package:dio/dio.dart';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.message,
    this.code,
    this.user,
  });

  String? message;
  int? code;
  User? user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        code: json["code"],
        user: json["code"] == 200 ? User.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "data": user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.location,
    this.countryId,
    this.img,
    this.isActive,
    this.token,
    // this.createdAt,
  });

  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? location;
  int? countryId;
  String? img;
  dynamic isActive;
  String? token;

  // DateTime? createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        location: json["location"],
        countryId: json["country_id"],
        img: json["img"],
        isActive: json["is_active"],
        token: json["token"],
        // createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "location": location,
        "country_id": countryId,
        "img": img,
        "is_active": isActive,
        "token": token,
        // "created_at":
        //     "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
      };

  Map<String, dynamic> toJsonRegister() => {
        "name": name,
        "email": email,
        "phone": phone,
        "location": location,
        "country_id": countryId,
        "password": password,
      };

  Future<Map<String, dynamic>> toJsonUpdateProfile() async => {
        "name": name,
        "email": email,
        "phone": phone,
        "location": location,
        "country_id": countryId,
        if (password != null) ...{
          "password": password,
        },
        if (img != null) ...{
          "img": await MultipartFile.fromFile(img!),
        },
      };
}
