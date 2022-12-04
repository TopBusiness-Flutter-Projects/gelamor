
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelamor/injector.dart' as injector;

import 'core/utils/app_routes.dart';
import 'core/utils/app_strings.dart';

class Glamor extends StatefulWidget {
  Glamor({Key? key}) : super(key: key);

  @override
  State<Glamor> createState() => _GlamorState();
}

class _GlamorState extends State<Glamor> {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
    // return MultiBlocProvider(
    //   providers: [
    //     // BlocProvider(
    //     //   create: (_) =>
    //     //       injector.serviceLocator<LocaleCubit>()..getSavedLanguage(),
    //     // ),
    //   ],
    //   child: const MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: AppStrings.appName,
    //     onGenerateRoute: AppRoutes.onGenerateRoute,
    //   ),
    // );
  }
}

