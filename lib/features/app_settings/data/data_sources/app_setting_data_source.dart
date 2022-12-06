import '../models/app_setting_data_model.dart';

abstract class BaseAppSettingDataSource{
  Future<AppSettingModel> getAppSettingsData();
}

class AppSettingDataSource extends BaseAppSettingDataSource{
  // final BaseApiConsumer apiConsumer;

  AppSettingDataSource();

  @override
  Future<AppSettingModel> getAppSettingsData() {
    // TODO: implement getAppSettingsData
    throw UnimplementedError();
  }
  // @override
  // Future<AppSettingModel> getAppSettingsData() async {
  // final response = await apiConsumer.get(EndPoints.settingsUrl);
  // return AppSettingModel.fromJson(response);
  // }
}