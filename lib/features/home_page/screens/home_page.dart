import 'package:flutter/material.dart';
import 'package:gelamor/core/utils/app_routes.dart';
import 'package:gelamor/core/utils/app_strings.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../widget/home_image_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppColors.white,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                ImageAssets.glamorLogo,
                width: 50,
                height: 50,
              ),
              Icon(Icons.notifications_none,color: AppColors.black,)
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 150,
              child: Image.asset(ImageAssets.main),
            ),
            HomeImageWidget(
              text: 'Weight loss',
              imagePath: ImageAssets.weight_background,
              // onClick: (){},
              onClick: ()=>Navigator.pushNamed(context, Routes.weightLoseScreenRoute),
            ),
            HomeImageWidget(
              text: 'Life style',
              imagePath: ImageAssets.life_style_background,
              onClick: (){},
            ),
            HomeImageWidget(
              text: 'increase weight',
              imagePath: ImageAssets.icrease_weight_background,
              onClick: (){},
            ),
          ],
        ),
      ),
    );

    // return Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Home Page'),
    //     ),
    //     body: LayoutBuilder(builder: (context, constraints) {
    //       final firstHeight = constraints.biggest.height * .3;
    //       final secondHeight = 200.0;
    //       final thirdHeight = 200.0;
    //       return Column(
    //         children: [
    //           Container(
    //             width: double.maxFinite,
    //             height: 200,
    //             child: Image.asset(ImageAssets.main),
    //           ),
    //           Expanded(
    //               child: Stack(children: [
    //             Positioned(
    //                 top: 0,
    //                 height: firstHeight,
    //                 left: 10,
    //                 right: 10,
    //                 child: HomeWidget(
    //                   title: 'sss',
    //                   path: ImageAssets.weight_background,
    //                   padding: 20,
    //                 )),
    //             Positioned(
    //                 top: (firstHeight - secondHeight / 2) + 10,
    //                 height: secondHeight,
    //                 left: 10,
    //                 right: 10,
    //                 child: HomeWidget(
    //                     title: 'ssss',
    //                     path: ImageAssets.life_style_background,
    //                     padding: 60)),
    //             Positioned(
    //                 top: (firstHeight + secondHeight - thirdHeight / 2) - 25,
    //                 height: thirdHeight,
    //                 left: 10,
    //                 right: 10,
    //                 child: HomeWidget(
    //                     title: 'sss',
    //                     path: ImageAssets.icrease_weight_background,
    //                     padding: 60))
    //           ]))
    //         ],
    //       );
    //     }));
  }
}
