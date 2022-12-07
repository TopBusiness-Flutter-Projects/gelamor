import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../home_page/screens/home_page.dart';
import '../../../navigation_bottom/screens/navigation_bottom.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child:  NavigationBottom(),
        ),
      );

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
    // if (prefs.getString('user') != null) {
    //   Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
    //   LoginDataModel loginDataModel = LoginDataModel.fromJson(userMap);
    //   this.loginDataModel = loginDataModel;
    // }
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
