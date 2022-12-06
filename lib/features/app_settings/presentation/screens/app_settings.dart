import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/show_loading_indicator.dart';
import '../cubit/app_setting_cubit.dart';

class AppSettingsScreens extends StatelessWidget {
  const AppSettingsScreens({Key? key, required this.kind}) : super(key: key);

  final String kind;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "",
          // AppLocalizations.of(context)!.translate(kind)!,
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: BlocBuilder<AppSettingCubit, AppSettingState>(
        builder: (BuildContext context, state) {
          if (state is AppSettingLoading) {
            return const ShowLoadingIndicator();
          } else if (state is AppSettingLoaded) {
            String text = '';
            if (kind == AppStrings.aboutUsText) {
              // text = IsLanguage.isEnLanguage(context)
              //     ? state.appSettingModel.data!.aboutUsEn!
              //     : (IsLanguage.isArLanguage(context)
              //         ? state.appSettingModel.data!.aboutUsAr!
              //         : state.appSettingModel.data!.aboutUsKu!);
            } else if (kind == AppStrings.termsAndConditionsText) {
              // text = IsLanguage.isEnLanguage(context)
              //     ? state.appSettingModel.data!.termsEn!
              //     : (IsLanguage.isArLanguage(context)
              //         ? state.appSettingModel.data!.termsAr!
              //         : state.appSettingModel.data!.termsKu!);
            } else if (kind == AppStrings.privacyText) {
              // text = IsLanguage.isEnLanguage(context)
              //     ? state.appSettingModel.data!.privacyEn!
              //     : (IsLanguage.isArLanguage(context)
              //         ? state.appSettingModel.data!.privacyAr!
              //         : state.appSettingModel.data!.privacyKu!);
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            ImageAssets.glamorLogo,
                            width: 287,
                            height: 161,
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'translateText(AppStrings.appName, context)',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          TextSpan(
                            text: 'translateText(AppStrings.helpYouText, context)',
                            style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                    HtmlWidget(text),
                    // LongText(text: text),
                  ],
                ),
              ),
            );
          }
          // else if (state is AppSettingError) {
          //   // return error_widget.ErrorWidget(
          //   //   onPressed: () =>
          //   //       context.read<AppSettingCubit>().getAllAppSettingData(),
          //   // );
          // }
          else {
            return const ShowLoadingIndicator();
          }
        },
      ),
    );
  }
}
