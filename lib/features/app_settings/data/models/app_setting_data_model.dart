
import '../../domain/entities/app_setting_domain_model.dart';

class AppSettingModel extends AppSetting {
  const AppSettingModel({ super.data});

  factory AppSettingModel.fromJson(Map<String, dynamic> json) =>
      AppSettingModel(
        data: AppSettingDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class AppSettingDataModel extends AppSettingData {
  const AppSettingDataModel(
      { super.id,
      super.aboutUsAr,
      super.termsAr,
      super.privacyAr,
      super.aboutUsEn,
      super.termsEn,
      super.privacyEn,
      super.nameEn,
      super.nameAr,
      super.facebook,
      super.insta,
      super.twitter,
      super.snapChat,
      super.whatsapp,
      super.createdAt,
      super.updatedAt,});

  factory AppSettingDataModel.fromJson(Map<String, dynamic> json) => AppSettingDataModel(
    id: json["id"],
    nameEn: json["name_en"],
    nameAr: json["about_ar"],
    aboutUsAr: json["about_us_ar"]??"لا توجد بيانات",
    termsAr: json["terms_ar"]??"لا توجد بيانات",
    privacyAr: json["privacy_ar"]??"لا توجد بيانات",
    aboutUsEn: json["about_us_en"]??"No Data",
    termsEn: json["terms_en"]??"No Data",
    privacyEn: json["privacy_en"]??"No Data",
    facebook: json["facebook"]??"No Url Facebook",
    insta: json["insta"]??"No Url insta",
    twitter: json["twitter"]??"No Url twitter",
    snapChat: json["snap_chat"]??"No Url Snap Chat",
    whatsapp: json["whatsapp"]??"No Whatsapp Number",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_en": nameEn,
    "about_ar": nameAr,
    "about_us_ar": aboutUsAr,
    "terms_ar": termsAr,
    "privacy_ar": privacyAr,
    "about_us_en": aboutUsEn,
    "terms_en": termsEn,
    "privacy_en": privacyEn,
    "facebook": facebook,
    "insta": insta,
    "twitter": twitter,
    "snap_chat": snapChat,
    "whatsapp": whatsapp,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
