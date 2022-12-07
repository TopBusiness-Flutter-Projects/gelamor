import '../../domain/entities/contact_us_domain_model.dart';

class ContactUsModel extends ContactUs {
  ContactUsModel(
      {required super.data, required super.message, required super.code});

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
        data: ContactUsDataModel.fromJson(json["contact"]),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "contact": data.toJson(),
        "message": message,
        "code": code,
      };
}

class ContactUsDataModel extends ContactUsData {
  ContactUsDataModel({
    super.name,
    super.email,
    super.subject,
    super.message,
    super.updatedAt,
    super.createdAt,
    super.id,
  });

  factory ContactUsDataModel.fromJson(Map<String, dynamic> json) =>
      ContactUsDataModel(
        name: json["name"],
        email: json["email"],
        subject: json["subject"],
        message: json["message"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "subject": subject,
        "message": message,
        "updated_at": updatedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "id": id,
      };
}
