import 'package:flutter/material.dart';
import 'package:gelamor/core/utils/app_routes.dart';
import 'package:gelamor/core/utils/assets_manager.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';

class WeightLoseResultScreen extends StatelessWidget {
  const WeightLoseResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'BMI',
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      canScaleToFit: false,
                      minimum: 0,
                      maximum: 150,
                      endAngle: 360,
                      startAngle: 180,
                      showLabels: false,
                      tickOffset: 20,
                      ranges: <GaugeRange>[
                        GaugeRange(
                          startValue: 0,
                          endValue: 150,
                          gradient: SweepGradient(
                            center: FractionalOffset.center,
                            colors: <Color>[
                              AppColors.color1, // yellow
                              AppColors.color2, // yellow
                              AppColors.color3, // yellow
                              AppColors.color4, // yellow
                            ],
                            stops: <double>[0.0, 0.75, 0.80, 1.0],
                          ),
                          color: Colors.orange,
                          startWidth: 15,
                          endWidth: 15,
                        ),
                      ],
                      pointers: <GaugePointer>[
                        MarkerPointer(
                          imageUrl: ImageAssets.pointImage,
                          value: 90,
                          enableAnimation: true,
                          markerHeight: 28,
                          markerWidth: 28,
                          color: AppColors.primary,
                          markerType: MarkerType.circle,
                        )
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Container(
                            child: Text(
                              'Normal',
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0,
                        ),
                        GaugeAnnotation(
                          widget: Container(
                            child: Text(
                              'BMI is: 24.9',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.2,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Normal Weight For Your Height!',
                          style: TextStyle(
                              fontSize: 22,
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'It Should not be less than 53.5 kg \n And Not More Than 72.3 kg',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The Best Weight For Your Height!',
                          style: TextStyle(
                              fontSize: 22,
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Your best ideal weight is 62.9 kg \nTo reach the best weight for your height, you must lose 9.1 kg',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Your daily calorie needs are 2,107 calories',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 55),
              CustomButton(
                text: 'Next Step',
                color: AppColors.primary,
                onClick: () =>Navigator.pushNamed(context, Routes.allPackagesScreensRoute),
                paddingHorizontal: 50,
                borderRadius: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  final String year;
  final int sales;

  SalesData(this.year, this.sales);
}
