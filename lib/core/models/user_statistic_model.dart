// To parse this JSON data, do
//
//     final userStatistic = userStatisticFromJson(jsonString);

import 'dart:convert';

UserStatistic userStatisticFromJson(String str) => UserStatistic.fromJson(json.decode(str));

String userStatisticToJson(UserStatistic data) => json.encode(data.toJson());

class UserStatistic {
  UserStatistic({
    this.data,
    this.message,
    this.code,
  });

  List<StatisticDatum>? data;
  String? message;
  int? code;

  factory UserStatistic.fromJson(Map<String, dynamic> json) => UserStatistic(
    data: List<StatisticDatum>.from(json["data"].map((x) => StatisticDatum.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}

class StatisticDatum {
  StatisticDatum({
    this.date,
    this.calories,
    this.day,
  });

  DateTime? date;
  int? calories;
  String? day;

  factory StatisticDatum.fromJson(Map<String, dynamic> json) => StatisticDatum(
    date: DateTime.parse(json["date"]),
    calories: json["calories"],
    day: json["day"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "calories": calories,
    "day": day,
  };
}
