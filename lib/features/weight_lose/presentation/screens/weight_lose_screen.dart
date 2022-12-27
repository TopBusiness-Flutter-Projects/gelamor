import 'package:flutter/material.dart';
import 'package:gelamor/core/utils/app_colors.dart';
import 'package:gelamor/core/utils/app_routes.dart';
import 'package:gelamor/core/widgets/custom_button.dart';

import '../widgets/gender_widget.dart';
import '../widgets/silder_widget.dart';
import '../widgets/wheel_listview_widget.dart';

class WeightLoseScreen extends StatelessWidget {
  WeightLoseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weight Loss',
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GenderWidget(),
            SizedBox(height: 12),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: AppColors.primary,
                      child: SliderWidget(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  WheelListviewWidget(titleText: 'Weight', indexCount: 300),
                  SizedBox(
                    width: 12,
                  ),
                  WheelListviewWidget(titleText: 'Age', indexCount: 100),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            CustomButton(
              text: 'Calculate',
              color: AppColors.primary,
              onClick: () =>Navigator.pushNamed(context, Routes.weightLoseResultScreenRoute),
              paddingHorizontal: 50,
            )
          ],
        ),
      ),
    );
  }
}
