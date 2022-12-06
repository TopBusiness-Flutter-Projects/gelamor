import 'package:dio/dio.dart';


class ServiceApi {
  late Dio dio;

  ServiceApi() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: '',
        contentType: "application/x-www-form-urlencoded",
        headers: {'Content-Type': 'application/x-www-form-urlencoded'});
    dio = Dio(baseOptions);
  }

  // Future<MessageDataModel> getAllMessage(
  //     String user_token, String room_id) async {
  //   try {
  //     BaseOptions options = dio.options;
  //     options.headers = {'Authorization': user_token};
  //     dio.options = options;
  //
  //     Response response = await dio.get('api/chat/oneRoom?room_id=${room_id}');
  //
  //     return MessageDataModel.fromJson(response.data);
  //   } on DioError catch (e) {
  //     print("dldldldldl${e}");
  //     final errorMessage = DioExceptions.fromDioError(e).toString();
  //     throw errorMessage;
  //   }
  // }

}
