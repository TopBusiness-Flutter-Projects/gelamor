import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/app_settings/data/models/app_setting_data_model.dart';
import '../../features/contact_us/data/models/contact_us_data_model.dart';
import '../../features/contact_us/domain/entities/send_contact_us_data_model.dart';
import '../../features/packages/models/all_packages_model.dart';
import '../../features/registeration/models/countries_model.dart';
import '../../features/registeration/models/login_model.dart';
import '../models/status_response_model.dart';
import '../models/user_statistic_model.dart';
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
      print('Url : ${EndPoints.contactUsUrl}');
      print('Response : \n ${response.data}');
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
      print('Url : ${EndPoints.appSettingsUrl}');
      print('Response : \n ${response.data}');
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
    print('Url : ${EndPoints.loginUrl}');
    print('Response : \n ${response.data}');
    return LoginModel.fromJson(response.data);
  }

  Future<LoginModel> userRegister(User user) async {
    Response response = await dio.post(
      EndPoints.registerUrl,
      data: user.toJsonRegister(),
    );
    print('Url : ${EndPoints.registerUrl}');
    print('Response : \n ${response.data}');
    return LoginModel.fromJson(response.data);
  }

  Future<LoginModel> userUpdateProfile(User user) async {
    print('Url : ${EndPoints.updateProfileUrl}');
    print('User : ${await user.toJsonUpdateProfile()}');
    var fields = FormData.fromMap({});
    fields = FormData.fromMap({
      "name": user.name,
      "email": user.email,
      "phone": user.phone,
      "location": user.location,
      "country_id": user.countryId,
      if (user.password != null) ...{
        "password": user.password,
      },
      if (user.img != null) ...{
        "img": await MultipartFile.fromFile(user.img!),
      },
    });
    Response response = await dio.post(
      EndPoints.updateProfileUrl,
      data: fields,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          'Authorization': user.token,
          "Accept":"application/json",
        },
      ),
    );
    print('Url : ${EndPoints.updateProfileUrl}');
    print('Response : \n ${response.data}');
    return LoginModel.fromJson(response.data);
  }

  Future<CountriesModel> countriesList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response response = await dio.get(EndPoints.countriesUrl,
        options: Options(headers: {
          'Accept-Language': await prefs.getString('lan'),
        }));
    print('Url : ${EndPoints.countriesUrl}');
    print('Response : \n ${response.data}');
    return CountriesModel.fromJson(response.data);
  }

  Future<StatusResponse> forgetPasswordApi(String email) async {
    Response response = await dio.post(
      EndPoints.forgetPasswordUrl,
      data: {
        'email': email,
      },
    );
    print('Url : ${EndPoints.forgetPasswordUrl}');
    print('Response : \n ${response.data}');
    return StatusResponse.fromJson(response.data);
  }

  Future<StatusResponse> checkCode(String code) async {
    final response = await dio.post(
      EndPoints.checkCodeUrl,
      data: {"code": code},
    );
    print('Url : ${EndPoints.checkCodeUrl}');
    print('Response : \n ${response.data}');
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
    print('Url : ${EndPoints.resetPasswordUrl}');
    print('Response : \n ${response.data}');
    return StatusResponse.fromJson(response.data);
  }

  Future<AllPackageModel> allPackageApis(String token, String lan) async {
    final response = await dio.get(
      EndPoints.allPackagesUrl,
      options: Options(
        headers: {
          'Authorization': token,
          'Accept-Language': lan,
        },
      ),
    );
    print('Url : ${EndPoints.allPackagesUrl}');
    print('Response : \n ${response.data}');
    return AllPackageModel.fromJson(response.data);
  }

  Future<StatusResponse> logoutUser(String token) async {
    print('Url : ${EndPoints.logoutUrl}');
    final response = await dio.post(
      EndPoints.logoutUrl,
      options: Options(
        headers: {
          'Authorization': '${token}',
        },
      ),
    );
    print('Url : ${EndPoints.logoutUrl}');
    print('Response : \n ${response.data}');
    return StatusResponse.fromJson(response.data);
  }

  Future<UserStatistic> userStatistics(String token) async {
    print('Url : ${EndPoints.userStatisticsUrl}');
    final response = await dio.get(
      EndPoints.userStatisticsUrl,
      options: Options(
        headers: {
          'Authorization': '${token}',
        },
      ),
    );
    print('Url : ${EndPoints.userStatisticsUrl}');
    print('Response : \n ${response.data}');
    return UserStatistic.fromJson(response.data);
  }
}
