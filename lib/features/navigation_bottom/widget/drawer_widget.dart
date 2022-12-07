import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/separator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/list_tile.dart';
import '../../app_settings/presentation/screens/app_settings.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);

  // final LoginDataModel loginDataModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Image.asset(
                  ImageAssets.glamorLogo,
                  fit: BoxFit.fill,
                )),
              ],
            ),
            MyListTile(
              image: ImageAssets.languageIcon,
              text: AppStrings.languageTitle,
              onClick: () {},
            ),
            MySeparator(height: 1, color: AppColors.gray),
            MyListTile(
              image: ImageAssets.accountPersonIcon,
              text: 'profile_title'.tr(),
              onClick: () {},
            ),
            MySeparator(height: 1, color: AppColors.gray),
            MyListTile(
              image: ImageAssets.aboutUsIcon,
              text: AppStrings.aboutUsText,
              onClick: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AppSettingsScreens(
                      kind: AppStrings.aboutUsText.tr(),
                    ),
                  ),
                );
              },
            ),
            MySeparator(height: 1, color: AppColors.gray),
            MyListTile(
              image: ImageAssets.contactUsIcon,
              text: AppStrings.contactUsText,
              onClick: () {
                Navigator.of(context).pushNamed(Routes.contactUsScreenRoute);
              },
            ),
            MySeparator(height: 1, color: AppColors.gray),
            MyListTile(
              image: ImageAssets.rateIcon,
              text: AppStrings.rateAppText,
              onClick: () {
                // Navigator.of(context).pushNamed(Routes.bloggsRoute);
              },
            ),
            MySeparator(height: 1, color: AppColors.gray),
            MyListTile(
              image: ImageAssets.privacyIcon,
              text: AppStrings.privacyText,
              onClick: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AppSettingsScreens(
                      kind: AppStrings.privacyText,
                    ),
                  ),
                );
              },
            ),
            MySeparator(height: 1, color: AppColors.gray),
            MyListTile(
              image: ImageAssets.termsIcon,
              text: AppStrings.termsAndConditionsText,
              onClick: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AppSettingsScreens(
                      kind: AppStrings.termsAndConditionsText,
                    ),
                  ),
                );
              },
            ),
            MySeparator(height: 1, color: AppColors.gray),
            MyListTile(
              image: ImageAssets.shareIcon,
              text: AppStrings.shareAppText,
              onClick: () =>
                  Share.share('check out my website https://fluttergems.dev'),
            ),
            MySeparator(height: 1, color: AppColors.gray),
            MyListTile(
              image: ImageAssets.logOutIcon,
              text: AppStrings.logOutText,
              onClick: () {},
            ),
            // loginDataModel.message != null
            //     ? MyListTile(
            //         image: ImageAssets.logOutIcon,
            //         text: translateText(AppStrings.logOutText, context),
            //         onClick: () async {
            //           context
            //               .read<LocaleCubit>()
            //               .logoutUser(context)
            //               .whenComplete(() async {
            //             if (context.read<LocaleCubit>().logout ==
            //                 'SuccessFully') {
            //               SharedPreferences prefs =
            //                   await SharedPreferences.getInstance();
            //               bool result = await prefs.remove('user');
            //               if (result) {
            //                 Routes.isLogout = true;
            //                 Navigator.pushAndRemoveUntil(
            //                     context,
            //                     PageTransition(
            //                       type: PageTransitionType.fade,
            //                       alignment: Alignment.center,
            //                       duration:
            //                           const Duration(milliseconds: 1300),
            //                       child: SplashScreen(),
            //                     ),
            //                     ModalRoute.withName(Routes.loginScreenRoute));
            //                 context.read<LocaleCubit>().loginDataModel = null;
            //               }
            //             }
            //           });
            //         },
            //       )
            //     : MyListTile(
            //         image: ImageAssets.logOutIcon,
            //         text: translateText(AppStrings.loginText, context),
            //         onClick: () {
            //           Navigator.of(context)
            //               .pushNamed(Routes.loginScreenRoute);
            //         },
            //       ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}
