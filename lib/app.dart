
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelamor/injector.dart' as injector;

import 'core/utils/app_routes.dart';
import 'core/utils/app_strings.dart';
import 'features/app_settings/presentation/cubit/app_setting_cubit.dart';
import 'features/contact_us/presentation/cubit/contact_us_cubit.dart';
import 'features/navigation_bottom/cubit/navigator_bottom_cubit.dart';
import 'features/packages/presentation/cubit/packages_cubit.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';
import 'features/registeration/presentation/cubit/registration_cubit.dart';

class Glamor extends StatefulWidget {
  Glamor({Key? key}) : super(key: key);

  @override
  State<Glamor> createState() => _GlamorState();
}

class _GlamorState extends State<Glamor> {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              injector.serviceLocator<ContactUsCubit>(),
        ),
        BlocProvider(
          create: (_) =>
              injector.serviceLocator<NavigatorBottomCubit>(),
        ),
        BlocProvider(
          create: (_) =>
              injector.serviceLocator<AppSettingCubit>(),
        ),
        BlocProvider(
          create: (_) =>
              injector.serviceLocator<RegistrationCubit>(),
        ),
        BlocProvider(
          create: (_) =>
              injector.serviceLocator<PackagesCubit>(),
        ),
        BlocProvider(
          create: (_) =>
              injector.serviceLocator<ProfileCubit>(),
        ),
      ],
      child:  MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}

