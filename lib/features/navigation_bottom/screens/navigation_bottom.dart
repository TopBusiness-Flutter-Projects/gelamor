import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelamor/core/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../home_page/screens/home_page.dart';
import '../../weight_lose/presentation/screens/calender_screen.dart';
import '../cubit/navigator_bottom_cubit.dart';
import '../widget/drawer_widget.dart';
import '../widget/navigator_bottom_widget.dart';

class NavigationBottom extends StatefulWidget {
  NavigationBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {

  //
  // shared() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.clear();
  //   print('doooooooooooooooooooooooooooooooooooooooone');
  // }

  @override
  void initState() {
    // shared();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        bottomNavigationBar: SizedBox(
          height: 60,
          child: NavigatorBottomWidget(),
        ),
        body: BlocBuilder<NavigatorBottomCubit, NavigatorBottomState>(
          builder: (context, state) {
           if (context.read<NavigatorBottomCubit>().page == 0) {

             return HomePageScreen();
           } else if (context.read<NavigatorBottomCubit>().page == 1) {
             return CalenderScreen();
            } else if (context.read<NavigatorBottomCubit>().page == 2) {
              return Container(color: AppColors.color1,);
            } else {
              return DrawerWidget();
            }
          },
        ));
  }
}
