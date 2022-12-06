// To parse this JSON data, do
//
//     final appSetting = appSettingFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/app_setting_data_model.dart';

AppSetting appSettingFromJson(String str) => AppSettingModel.fromJson(json.decode(str));

String appSettingToJson(AppSettingModel data) => json.encode(data.toJson());

class AppSetting extends Equatable{
  const AppSetting({
      this.data,
  });

  final AppSettingDataModel? data;

  @override
  List<Object?> get props => [data];
}

class AppSettingData extends Equatable{
  const AppSettingData({
    this.id,
    this.aboutUsAr,
    this.termsAr,
    this.privacyAr,
    this.aboutUsEn,
    this.termsEn,
    this.privacyEn,
    this.nameAr,
    this.nameEn,
    this.facebook,
    this.insta,
    this.twitter,
    this.snapChat,
    this.whatsapp,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? aboutUsAr;
  final String? termsAr;
  final String? privacyAr;
  final String? aboutUsEn;
  final String? termsEn;
  final String? privacyEn;
  final String? nameAr;
  final String? nameEn;
  final String? facebook;
  final String? insta;
  final String? twitter;
  final String? snapChat;
  final String? whatsapp;
  final DateTime? createdAt;
  final DateTime? updatedAt;



  @override
  List<Object?> get props => [
    id,
    aboutUsAr,
    termsAr,
    privacyAr,
    aboutUsEn,
    termsEn,
    privacyEn,
    nameEn,
    nameAr,
    facebook,
    insta,
    twitter,
    snapChat,
    whatsapp,
    createdAt,
    updatedAt,
  ];
}
