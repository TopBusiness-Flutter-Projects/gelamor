// To parse this JSON data, do
//
//     final sendContactUsModel = sendContactUsModelFromJson(jsonString);

import 'dart:convert';

SendContactUsModel sendContactUsModelFromJson(String str) => SendContactUsModel.fromJson(json.decode(str));

String sendContactUsModelToJson(SendContactUsModel data) => json.encode(data.toJson());

class SendContactUsModel {
  SendContactUsModel({
    this.name,
    this.email,
    this.message,
    this.subject,
  });

  String? name;
  String? email;
  String? message;
  String? subject;

  factory SendContactUsModel.fromJson(Map<String, dynamic> json) => SendContactUsModel(
    name: json["name"],
    email: json["email"],
    message: json["message"],
    subject: json["subject"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "message": message,
    "subject": subject,
  };
}
