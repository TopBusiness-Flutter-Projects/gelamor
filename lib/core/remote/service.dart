import 'package:dio/dio.dart';

import '../../features/contact_us/data/models/contact_us_data_model.dart';
import '../../features/contact_us/domain/entities/send_contact_us_data_model.dart';
import '../utils/end_points.dart';
import 'handle_exeption.dart';

class ServiceApi {
  late Dio dio;

  ServiceApi() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: EndPoints.baseUrl,
        contentType: "application/x-www-form-urlencoded",
        headers: {'Content-Type': 'application/x-www-form-urlencoded'});
    dio = Dio(baseOptions);
  }

  Future<ContactUsModel> contactUsApi(SendContactUsModel sendContactUsModel) async {
    try {
      // BaseOptions options = dio.options;
      // // options.headers = {'Authorization': user_token};
      // // dio.options = options;
      Response response = await dio.get(EndPoints.contactUsUrl);
      print("Response : ${response.data}");
      return ContactUsModel.fromJson(response.data);
    } on DioError catch (e) {
      print(" Error : ${e}");
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
  Future<ContactUsModel> appSettingsApi() async {
    try {
      Response response = await dio.get(EndPoints.contactUsUrl);
      print("Response : ${response.data}");
      return ContactUsModel.fromJson(response.data);
    } on DioError catch (e) {
      print(" Error : ${e}");
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
