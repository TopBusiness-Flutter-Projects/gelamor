import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelamor/core/utils/app_colors.dart';
import 'package:gelamor/core/utils/app_routes.dart';
import 'package:gelamor/core/utils/assets_manager.dart';
import 'package:gelamor/core/utils/snackbar_method.dart';
import 'package:gelamor/core/widgets/my_svg_widget.dart';
import 'package:gelamor/core/widgets/show_loading_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/models/user_statistic_model.dart';
import '../../../../core/widgets/circle_image_widget.dart';
import '../../../../core/widgets/network_image.dart';
import '../../../registeration/presentation/cubit/registration_cubit.dart';
import '../../../registeration/presentation/screens/register.dart';
import '../cubit/profile_cubit.dart';

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  List<_SalesData> data = [
    _SalesData('2022-12-21', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40),
    _SalesData('yy', 70),
    _SalesData('ytr', 55)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          ProfileCubit profileCubit = context.read<ProfileCubit>();

          if (state is ProfileLogoutLoading || state is ProfileUserLoading) {
            return ShowLoadingIndicator();
          } else if (state is ProfileLogoutLoaded) {
            Future.delayed(Duration(milliseconds: 300), () {
              snackBar(
                'Logout Successfully',
                context,
                color: AppColors.success,
              );
            });
            Future.delayed(Duration(milliseconds: 600), () {
              profileCubit.clearSharedUser();
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.initialRoute,
                ModalRoute.withName(
                  Routes.profileRoute,
                ),
              );
            });
            return ShowLoadingIndicator();
          }
          return SafeArea(
            child: CircleImageWidget(
              isUp: true,
              myWidget: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2 - 60,
                        width: MediaQuery.of(context).size.width,
                        color: AppColors.primary,
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 4,
                        bottom: MediaQuery.of(context).size.height / 10,
                        left: MediaQuery.of(context).size.width / 2 - 50,
                        child: SizedBox(
                          width: 96,
                          height: 96,
                          child: CircleAvatar(
                            backgroundColor: AppColors.white,
                            child: ClipOval(
                              child: ManageNetworkImage(
                                imageUrl:
                                    profileCubit.loginDataModel.user!.img!,
                                width: 140,
                                height: 140,
                                borderRadius: 140,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        left: 0,
                        child: Column(
                          children: [
                            Text(
                              'Welcome Back, ${profileCubit.loginDataModel.user!.name}',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
                            ),
                            SizedBox(height: 4),
                            TextButton(
                              onPressed: () => profileCubit.logoutUser(),
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                  color: AppColors.error,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 22,
                        top: MediaQuery.of(context).size.height / 4,
                        child: InkWell(
                          onTap: () {
                            context.read<RegistrationCubit>().putDataToUpdate(
                                  context.read<ProfileCubit>().loginDataModel,
                                );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.grey7,
                            ),
                            child: MySvgWidget(
                              path: ImageAssets.editPenIcon,
                              width: 35,
                              height: 35,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 22,
                        top: 22,
                        child: Container(
                          width: 40,
                          height: 40,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.grey7,
                          ),
                          child: Icon(Icons.clear),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 20.0),
                    width: double.infinity,
                    child: const Text(
                      " : عدد السعرات هذا الاسبوع ",
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(5.0),
                    child: Card(
                      elevation: 30.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: profileCubit.statisticList == null
                          ? SizedBox(
                              height: 250,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primary,
                                ),
                              ),
                            )
                          : SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              primaryYAxis: NumericAxis(
                                minimum: 0,
                                maximum: double.parse(
                                  profileCubit.maxCalories.toString(),
                                ),
                                interval: 100,
                                isVisible: false,
                              ),
                              tooltipBehavior: TooltipBehavior(enable: true),
                              series: <ChartSeries<StatisticDatum, dynamic>>[
                                ColumnSeries<StatisticDatum, dynamic>(
                                  dataSource: profileCubit.statisticList!,
                                  xValueMapper: (StatisticDatum graph, _) =>
                                      '${graph.day} \n ${graph.date!.day}-${graph.date!.month}',
                                  yValueMapper: (StatisticDatum graph, _) =>
                                      graph.calories,
                                  name: '',
                                  trackColor: AppColors.error,
                                  dataLabelSettings:
                                      DataLabelSettings(isVisible: true),
                                  gradient: LinearGradient(colors: [
                                    AppColors.error,
                                    AppColors.error,
                                  ]),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    topLeft: Radius.circular(25),
                                  ),
                                  color:
                                      const Color.fromRGBO(14, 113, 179, 1.0),
                                )
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
