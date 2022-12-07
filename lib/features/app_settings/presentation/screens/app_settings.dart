import 'package:easy_localization/easy_localization.dart';
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
    String lang = EasyLocalization.of(context)!.locale.languageCode;

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
              text = lang != 'ar'
                  ? state.appSettingModel.data!.aboutUsEn!
                  : state.appSettingModel.data!.aboutUsAr!;
            } else if (kind == AppStrings.termsAndConditionsText) {
              text = lang != 'ar'
                  ? state.appSettingModel.data!.termsEn!
                  : state.appSettingModel.data!.termsAr!;
            } else if (kind == AppStrings.privacyText) {
              text = lang != 'ar'
                  ? state.appSettingModel.data!.privacyEn!
                  : state.appSettingModel.data!.privacyAr!;
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25),
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
                    kind == AppStrings.aboutUsText?RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: lang != 'ar'
                                ? state.appSettingModel.data!.nameEn
                                : state.appSettingModel.data!.nameAr,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          TextSpan(
                            text: AppStrings.helpYouText,
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ):SizedBox(),
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
