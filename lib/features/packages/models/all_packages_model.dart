// To parse this JSON data, do
//
//     final allPackageModel = allPackageModelFromJson(jsonString);

import 'dart:convert';

AllPackageModel allPackageModelFromJson(String str) => AllPackageModel.fromJson(json.decode(str));

String allPackageModelToJson(AllPackageModel data) => json.encode(data.toJson());

class AllPackageModel {
  AllPackageModel({
    this.message,
    this.code,
    this.data,
  });

  String? message;
  int? code;
  List<PackagesDatum>? data;

  factory AllPackageModel.fromJson(Map<String, dynamic> json) => AllPackageModel(
    message: json["message"],
    code: json["code"],
    data: List<PackagesDatum>.from(json["data"].map((x) => PackagesDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "code": code,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PackagesDatum {
  PackagesDatum({
    this.id,
    this.name,
    this.details,
    this.price,
    this.currency,
    this.status,
  });

  int? id;
  String? name;
  String? details;
  int? price;
  String? currency;
  String? status;

  factory PackagesDatum.fromJson(Map<String, dynamic> json) => PackagesDatum(
    id: json["id"],
    name: json["name"],
    details: json["details"],
    price: json["price"],
    currency: json["currency"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "details": details,
    "price": price,
    "currency_": currency,
    "status": status,
  };
}
