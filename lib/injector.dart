import 'package:dio/dio.dart';
import 'package:gelamor/features/navigation_bottom/cubit/navigator_bottom_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/contact_us/presentation/cubit/contact_us_cubit.dart';
// import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features

  ///////////////////////// Blocs ////////////////////////

  serviceLocator.registerFactory(
    () => ContactUsCubit(
      serviceLocator(),
    ),
  );
serviceLocator.registerFactory(() => NavigatorBottomCubit());
  ///////////////////// Use Cases ////////////////////////
  //
  // serviceLocator.registerLazySingleton(
  //     () => GetSavedLanguageUseCase(languageRepository: serviceLocator()));
  //
  //////////////////////// Repositories ////////////////////////

  // serviceLocator.registerLazySingleton<BaseLanguageRepository>(
  //   () => LanguageRepository(
  //     languageLocaleDataSource: serviceLocator(),
  //   ),
  // );
  //
  //////////////////////// Data Sources ////////////////////////
  //
  // serviceLocator.registerLazySingleton<BaseLanguageLocaleDataSource>(
  //     () => LanguageLocaleDataSource(sharedPreferences: serviceLocator()));
  //
  //! Core
  //Network
  // serviceLocator.registerLazySingleton(() => NavigationService());
  // serviceLocator.registerLazySingleton<BaseNetworkInfo>(
  //     () => NetworkInfo(connectionChecker: serviceLocator()));

  // Api Consumer
  // serviceLocator.registerLazySingleton<BaseApiConsumer>(
  //     () => DioConsumer(client: serviceLocator()));

  //! External
  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  // http
  // serviceLocator.registerLazySingleton(() => http.Client());

  // Dio
  serviceLocator.registerLazySingleton(() => Dio());
  // serviceLocator.registerLazySingleton(() => AppInterceptors());
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

  // Internet Connection Checker
  // serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}
