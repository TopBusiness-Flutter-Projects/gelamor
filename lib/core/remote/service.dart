import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/app_settings/data/models/app_setting_data_model.dart';
import '../../features/contact_us/data/models/contact_us_data_model.dart';
import '../../features/contact_us/domain/entities/send_contact_us_data_model.dart';
import '../../features/packages/models/all_packages_model.dart';
import '../../features/registeration/models/countries_model.dart';
import '../../features/registeration/models/login_model.dart';
import '../models/status_response_model.dart';
import '../utils/end_points.dart';
import 'handle_exeption.dart';

class ServiceApi {
  final Dio dio;

  ServiceApi(this.dio);

  Future<ContactUsModel> contactUsApi(
      SendContactUsModel sendContactUsModel) async {
    try {
      print(EndPoints.contactUsUrl);
      Response response = await dio.post(EndPoints.contactUsUrl,
          data: sendContactUsModel.toJson());
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

  Future<LoginModel> userLogin(String email, String password) async {
    Response response = await dio.post(
      EndPoints.loginUrl,
      data: {
        "email": email,
        "password": password,
      },
    );
    print("Response : ${response.data}");
    return LoginModel.fromJson(response.data);
  }

  Future<LoginModel> userRegister(User user) async {
    Response response = await dio.post(
      EndPoints.registerUrl,
      data: {
        "name": user.name,
        "email": user.email,
        "password": user.password,
        "phone": user.phone,
        "location": user.location,
        "country_id": user.countryId,
      },
    );
    print("Response : ${response.data}");
    return LoginModel.fromJson(response.data);
  }

  Future<CountriesModel> countriesList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response response = await dio.get(EndPoints.countriesUrl,
        options: Options(headers: {
          'Accept-Language': await prefs.getString('lan'),
        }));
    print("Response : ${response.data}");
    return CountriesModel.fromJson(response.data);
  }

  Future<StatusResponse> forgetPasswordApi(String email) async {
    Response response = await dio.post(
      EndPoints.forgetPasswordUrl,
      data: {
        'email': email,
      },
    );
    print("Response : ${response.data}");
    return StatusResponse.fromJson(response.data);
  }

  Future<StatusResponse> checkCode(String code) async {
    final response = await dio.post(
      EndPoints.checkCodeUrl,
      data: {"code": code},
    );
    print("Response : ${response.data}");
    return StatusResponse.checkCodeFromJson(response.data);
  }

  Future<StatusResponse> resetPassword(String passwords, String code) async {
    final response = await dio.post(
      EndPoints.resetPasswordUrl,
      data: {
        "code": code,
        'password': passwords,
        'password_confirmation': passwords,
      },
    );
    print("Response : ${response.data}");
    return StatusResponse.fromJson(response.data);
  }

  Future<AllPackageModel> allPackageApis(String token,String lan) async {
    final response = await dio.get(
      EndPoints.allPackagesUrl,
      options: Options(
        headers: {
          'Authorization': token,
          'Accept-Language':lan
        },
      ),
    );
    print("Response : ${response.data}");
    return AllPackageModel.fromJson(response.data);
  }
}
