import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelamor/core/widgets/show_loading_indicator.dart';
import 'package:gelamor/features/packages/presentation/cubit/packages_cubit.dart';
import 'package:gelamor/features/packages/presentation/cubit/packages_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';

class CardWheelWidget extends StatefulWidget {
  CardWheelWidget({Key? key, required this.indexCount}) : super(key: key);
  final int indexCount;

  @override
  State<CardWheelWidget> createState() => _CardWheelWidgetState();
}

class _CardWheelWidgetState extends State<CardWheelWidget> {
  int selected = 0;
  double itemWidth = 60.0;

  FixedExtentScrollController _scrollController = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackagesCubit, PackagesState>(
      builder: (context, state) {
        PackagesCubit packagesCubit = context.read<PackagesCubit>();
        return SizedBox(
          height: 600,
          width: 500,
          child: Center(
            child: ListWheelScrollView(
              physics: FixedExtentScrollPhysics(),
              onSelectedItemChanged: (x) {
                setState(() {
                  selected = x;
                });
                print(selected);
              },
              controller: _scrollController,
              children: List.generate(
                packagesCubit.packagesListLength,
                (x) => AnimatedContainer(
                  duration: Duration(milliseconds: 800),
                  width: x == selected ? 500 : 500,
                  height: x == selected ? 400 : 0,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      color: AppColors.white,
                      child: state is AllPackagesLoading
                          ? Center(child: CircularProgressIndicator(color: AppColors.primary,),)
                          : state is AllPackagesError
                              ? Center(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.refresh),
                                  ),
                                )
                              : state is AllPackagesLoaded
                                  ? Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 12),
                                            Text(
                                              'POPULAR',
                                            ),
                                            SizedBox(height: 16),
                                            Text(
                                              'Exercise Class',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 25),
                                            Text(
                                              '${state.packagesDatum[x].price} ${state.packagesDatum[x].currency}',
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 0),
                                            Text(
                                              'For ${state.packagesDatum[x].name}',
                                            ),
                                            SizedBox(height: 40),
                                            Text(
                                              '${state.packagesDatum[x].details}',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(height: 45),
                                            CustomButton(
                                              text: 'Subscribe',
                                              color: AppColors.primary,
                                              onClick: () {},
                                              paddingHorizontal: 20,
                                              borderRadius: 30,
                                            ),
                                            SizedBox(height: 14),
                                          ],
                                        ),
                                      ),
                                    )
                                  :  Center(child: CircularProgressIndicator(color: AppColors.primary,),),
                    ),
                  ),
                ),
              ),
              itemExtent: 400,
              // squeeze: 1.1,
              perspective: 0.007,
              diameterRatio: 4,
            ),
          ),
        );
      },
    );
  }
}
