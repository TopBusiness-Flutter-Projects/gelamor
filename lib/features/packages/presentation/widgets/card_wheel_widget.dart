import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelamor/core/widgets/my_svg_widget.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:gelamor/features/packages/presentation/cubit/packages_cubit.dart';
import 'package:gelamor/features/packages/presentation/cubit/packages_cubit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
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
  final double _itemHeight = 400.0;
  final data = List.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackagesCubit, PackagesState>(
      builder: (context, state) {
        PackagesCubit packagesCubit = context.read<PackagesCubit>();
        return Column(
          children: [
            ...List.generate(
              packagesCubit.packagesListLength,
              (x) => Padding(
                padding: const EdgeInsets.all(0.0),
                child: InkWell(
                  onTap: () {
                    print('909090990909090909090');
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    color: AppColors.white,
                    child: state is AllPackagesLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          )
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
                                            onClick: () {
                                              print('0000000000000000');
                                              Alert(
                                                context: context,
                                                type: AlertType.none,
                                                title: 'Choose Payment Method',
                                                content: SizedBox(
                                                  height: 250,
                                                  width: 280,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Spacer(),
                                                      Row(
                                                        children: [
                                                          SizedBox(height: 20),
                                                          MySvgWidget(
                                                            path: ImageAssets
                                                                .visaIcon,
                                                            width: 32,
                                                            height: 32,
                                                          ),
                                                          SizedBox(width: 12),
                                                          Text(
                                                              'Visa  Or Master Card'),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      Row(
                                                        children: [
                                                          MySvgWidget(
                                                              path: ImageAssets
                                                                  .kNetIcon,
                                                            width: 32,
                                                            height: 32,
                                                          ),
                                                          SizedBox(width: 12),
                                                          Text('K Net'),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      Row(
                                                        children: [
                                                          MySvgWidget(
                                                              path: ImageAssets
                                                                  .cashIcon,
                                                            width: 32,
                                                            height: 32,
                                                          ),
                                                          SizedBox(width: 12),
                                                          Text('Cash'),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                    ],
                                                  ),
                                                ),
                                                buttons: [],
                                              ).show();
                                            },
                                            paddingHorizontal: 20,
                                            borderRadius: 30,
                                          ),
                                          SizedBox(height: 14),
                                        ],
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.primary,
                                    ),
                                  ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  buttonAlertDialog() {
    Alert(
        context: context,
        // type: AlertType.none,
        title: 'Choose Payment Method',
        content: Column(
          children: [
            Row(
              children: [
                MySvgWidget(path: ImageAssets.visaIcon),
                Text('Visa  Or Master Card'),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                MySvgWidget(path: ImageAssets.kNetIcon),
                Text('K Net'),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                MySvgWidget(path: ImageAssets.cashIcon),
                Text('Cash'),
              ],
            ),
            SizedBox(height: 12),
          ],
        )).show();
  }
}
