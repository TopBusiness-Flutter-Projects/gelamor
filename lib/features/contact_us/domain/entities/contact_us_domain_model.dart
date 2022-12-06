// To parse this JSON data, do
//
//     final contactUs = contactUsFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/contact_us_data_model.dart';

ContactUs contactUsFromJson(String str) => ContactUsModel.fromJson(json.decode(str));

String contactUsToJson(ContactUsModel data) => json.encode(data.toJson());

class ContactUs extends Equatable{
  ContactUs({
    required this.data,
    required this.message,
    required this.code,
  });

  late ContactUsDataModel data;
  late String message;
  late int code;

  @override
  List<Object?> get props => [
    data,
    message,
    code,
  ];
}

class ContactUsData extends Equatable{
  ContactUsData({
    this.name,
    this.email,
    this.subject,
    this.message,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  late String? name;
  late String? email;
  late String? subject;
  late String? message;
  late DateTime? updatedAt;
  late DateTime? createdAt;
  late int? id;


  @override
  List<Object?> get props => [
    name,
    email,
    subject,
    message,
    updatedAt,
    createdAt,
    id,
  ];
}
