import 'dart:collection';

import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import 'package:gelamor/core/utils/app_colors.dart';
import 'package:gelamor/core/utils/assets_manager.dart';
import 'package:gelamor/core/widgets/my_svg_widget.dart';

class SliderWidget extends StatefulWidget {
  SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _lowerValue = 150;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _lowerValue.toString()+' Cm',
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(height: 32),
        Row(
          children: [
            Expanded(
              child: MySvgWidget(
                path: ImageAssets.sliderIcon,
                height: null,
                width: null,
              ),
            ),
            Expanded(
              flex: 5,
              child: SliderTheme(
                data: SliderThemeData(
                    thumbColor: Colors.black,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)),
                child: Slider(
                  value: _lowerValue,
                  max: 250,
                  min: 0,
                  thumbColor: AppColors.black,
                  activeColor: AppColors.white,
                  inactiveColor: AppColors.white,
                  onChanged: (val) {
                    _lowerValue = double.parse(val.toString().substring(0, 3));
                    setState(() {});
                  },
                ),
              ),
              // FlutterSlider(
              //   values: [_lowerValue],
              //   max: 250,
              //   min: 0,
              //
              //   trackBar: FlutterSliderTrackBar(
              //
              //     activeDisabledTrackBarColor: AppColors.white,
              //     activeTrackBar: BoxDecoration(color: AppColors.white),
              //   ),
              //   onDragging: (handlerIndex, lowerValue, upperValue) {
              //     _lowerValue = lowerValue;
              //     setState(() {});
              //   },
              // ),
            )
          ],
        )
      ],
    );
  }
}
