import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Container(
            width: 500,
            height: 500,
            color: AppColors.primary,
          )
        ],
      ),
    );
  }
}
