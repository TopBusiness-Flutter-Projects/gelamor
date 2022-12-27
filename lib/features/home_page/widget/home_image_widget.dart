import 'package:flutter/material.dart';

import '../../../core/utils/assets_manager.dart';

class HomeImageWidget extends StatelessWidget {
  const HomeImageWidget({Key? key, required this.imagePath, required this.text, required this.onClick})
      : super(key: key);
  final String imagePath;
  final String text;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: SizedBox(
        width: MediaQuery.of(context).size.width-25,
        child: Stack(
          children: [
            Image.asset(imagePath,fit: BoxFit.cover,width: 420,),
            Positioned(
              top: imagePath != ImageAssets.weight_background ? 60 : 12,
              left: 20,
              child: Text(text,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}
