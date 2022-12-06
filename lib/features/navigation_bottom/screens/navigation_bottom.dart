import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelamor/features/home_page/presentation/screens/home_page.dart';


import '../cubit/navigator_bottom_cubit.dart';
import '../widget/navigator_bottom_widget.dart';

class NavigationBottom extends StatefulWidget {
  NavigationBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
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
            return HomePageScreen();
            } else if (context.read<NavigatorBottomCubit>().page == 2) {
              return HomePageScreen();
            } else {
              return HomePageScreen();
            }
          },
        ));
  }
}
