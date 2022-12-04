import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'app_bloc_observer.dart';
import 'package:gelamor/injector.dart' as injector;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.setup();
  BlocOverrides.runZoned(
    () => runApp(Glamor()),
    blocObserver: AppBlocObserver(),
  );
}
