import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelamor/core/utils/app_colors.dart';
import 'package:gelamor/features/packages/presentation/cubit/packages_cubit.dart';

import '../../../../core/widgets/circle_image_widget.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/card_wheel_widget.dart';

class AllPackagesScreens extends StatelessWidget {
  const AllPackagesScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CircleImageWidget(
          myWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: RefreshIndicator(
                onRefresh: ()async{
                  context.read<PackagesCubit>().getAllPackagesApi();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 5),
                    Text(
                      'Start your challenge',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Take the first step towards a healthier and happier life.',
                      style: TextStyle(fontSize: 16),
                    ),
                    CardWheelWidget(indexCount: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
