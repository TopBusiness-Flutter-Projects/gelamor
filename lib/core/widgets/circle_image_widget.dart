import 'package:flutter/material.dart';

import '../utils/assets_manager.dart';

class CircleImageWidget extends StatelessWidget {
  const CircleImageWidget({Key? key, required this.myWidget}) : super(key: key);

  final Widget myWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -100,
          left: -105,
          child: Image.asset(ImageAssets.twoCircleImage,width: 300,height: 250,),
        ),
        myWidget
      ],
    );
  }
}
