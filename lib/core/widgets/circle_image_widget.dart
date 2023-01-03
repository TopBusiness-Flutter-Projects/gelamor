import 'package:flutter/material.dart';

import '../utils/assets_manager.dart';

class CircleImageWidget extends StatelessWidget {
  const CircleImageWidget({Key? key, required this.myWidget, this.isUp = false})
      : super(key: key);

  final Widget myWidget;
  final bool? isUp;

  @override
  Widget build(BuildContext context) {
    return isUp! ? Stack(
      children: [
        myWidget,
        Positioned(
          top: -100,
          left: -105,
          child: Image.asset(
            ImageAssets.twoCircleImage,
            width: 300,
            height: 250,
          ),
        ),
      ],
    ):Stack(
      children: [
        Positioned(
          top: -100,
          left: -105,
          child: Image.asset(
            ImageAssets.twoCircleImage,
            width: 300,
            height: 250,
          ),
        ),
        myWidget
      ],
    );
  }
}
