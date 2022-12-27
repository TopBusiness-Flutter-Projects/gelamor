// To parse this JSON data, do
//
//     final countriesModel = countriesModelFromJson(jsonString);

import 'dart:convert';

CountriesModel countriesModelFromJson(String str) => CountriesModel.fromJson(json.decode(str));

String countriesModelToJson(CountriesModel data) => json.encode(data.toJson());

class CountriesModel {
  CountriesModel({
    this.countries,
    this.msg,
    this.status,
  });

  List<Country>? countries;
  String? msg;
  int? status;

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
    countries: List<Country>.from(json["data"].map((x) => Country.fromJson(x))),
    msg: json["message"],
    status: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(countries!.map((x) => x.toJson())),
    "message": msg,
    "code": status,
  };
}

class Country {
  Country({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
