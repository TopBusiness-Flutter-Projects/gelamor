import 'package:dio/dio.dart';
import 'package:gelamor/features/navigation_bottom/cubit/navigator_bottom_cubit.dart';
import 'package:gelamor/features/packages/presentation/cubit/packages_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/remote/service.dart';
import 'features/app_settings/presentation/cubit/app_setting_cubit.dart';
import 'features/contact_us/presentation/cubit/contact_us_cubit.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';
import 'features/registeration/presentation/cubit/registration_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features

  ///////////////////////// Blocs ////////////////////////

  serviceLocator.registerFactory(
    () => ContactUsCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => AppSettingCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => RegistrationCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => PackagesCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => ProfileCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(() => NavigatorBottomCubit());

  serviceLocator.registerLazySingleton(() => ServiceApi(serviceLocator()));

  //! External
  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  // Dio
  serviceLocator.registerLazySingleton(
    () => Dio(
      BaseOptions(
        contentType: "application/x-www-form-urlencoded",
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );
}
