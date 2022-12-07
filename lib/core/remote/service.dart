import 'package:dio/dio.dart';

import '../../features/app_settings/data/models/app_setting_data_model.dart';
import '../../features/contact_us/data/models/contact_us_data_model.dart';
import '../../features/contact_us/domain/entities/send_contact_us_data_model.dart';
import '../utils/end_points.dart';
import 'handle_exeption.dart';

class ServiceApi {
  final Dio dio;

  ServiceApi(this.dio);


  Future<ContactUsModel> contactUsApi(SendContactUsModel sendContactUsModel) async {
    try {
      print(EndPoints.contactUsUrl);
      Response response = await dio.post(EndPoints.contactUsUrl,data: sendContactUsModel.toJson());
      print("Response : ${response.data}");
      return ContactUsModel.fromJson(response.data);
    } on DioError catch (e) {
      print(" Error : ${e}");
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
  Future<AppSettingModel> appSettingsApi() async {
    try {
      Response response = await dio.get(EndPoints.appSettingsUrl);
      print("Response : ${response.data}");
      return AppSettingModel.fromJson(response.data);
    } on DioError catch (e) {
      print(" Error : ${e}");
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
