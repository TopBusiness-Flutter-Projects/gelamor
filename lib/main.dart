import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'app_bloc_observer.dart';
import 'package:gelamor/injector.dart' as injector;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await injector.setup();
  BlocOverrides.runZoned(
    () => runApp(
      EasyLocalization(
        supportedLocales: const [Locale('ar', ''), Locale('en', '')],
        path: 'assets/lang',
        saveLocale: true,
        startLocale: const Locale('ar', ''),
        fallbackLocale: const Locale('ar', ''),
        child: Glamor(),
      ),
    ),
    blocObserver: AppBlocObserver(),
  );
}
