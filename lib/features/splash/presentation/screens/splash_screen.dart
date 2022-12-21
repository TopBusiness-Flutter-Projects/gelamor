import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gelamor/features/registeration/presentation/screens/register.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/circle_image_widget.dart';
import '../../../home_page/screens/home_page.dart';
import '../../../navigation_bottom/screens/navigation_bottom.dart';
import '../../../registeration/models/login_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  LoginModel? loginModel;

  _goNext() {
    if (loginModel != null) {
      print('there is a User : ${loginModel!.user!.name}');
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: NavigationBottom(),
        ),
      );
    } else {
      print('there is no User !!!!!!');
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: RegisterScreen(),
        ),
      );
    }
  }

  _startDelay() async {
    // if (await Permission.location.request().isDenied) {
    //   Map<Permission, PermissionStatus> statuses = await [
    //     Permission.location,
    //   ].request();
    //   print(statuses[Permission.location]);
    // }
    // if (await Permission.storage.request().isDenied) {
    //   Map<Permission, PermissionStatus> statuses = await [
    //     Permission.storage,
    //   ].request();
    //   print(statuses[Permission.storage]);
    // }

    _timer = Timer(const Duration(milliseconds: 3000), () => _goNext());
  }

  Future<void> _getStoreUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user') != null) {
      Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
      LoginModel loginDataModel = LoginModel.fromJson(userMap);
      this.loginModel = loginDataModel;
    }
    if (await prefs.getString('lan') == null) {
      await prefs.setString(
          'lan', EasyLocalization.of(context)!.locale.languageCode);
    }
  }

  @override
  void initState() {
    super.initState();
    _getStoreUser().then((value) => _startDelay());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              ImageAssets.glamorLogo,
            ),
          ),
        ],
      ),
    );
  }
}
