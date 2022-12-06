import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/my_svg_widget.dart';
import '../cubit/navigator_bottom_cubit.dart';

class NavigatorBottomWidget extends StatelessWidget {
  NavigatorBottomWidget({Key? key}) : super(key: key);
  late int _page;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigatorBottomCubit, NavigatorBottomState>(
      builder: (context, state) {
        this._page = context.read<NavigatorBottomCubit>().page;
        return Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  context.read<NavigatorBottomCubit>().changePage(0);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                      MySvgWidget(
                        path: ImageAssets.contactUsImage,
                        color:  _page == 2 ?  AppColors.primary : AppColors.grey1,
                        width:  24,
                        height: 24,
                      ),
                      Text(
                        _page == 0 ? "home".tr() : "",
                        style: TextStyle(
                          color: _page == 0
                              ?  AppColors.primary
                              : AppColors.grey1,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: (){
                  context.read<NavigatorBottomCubit>().changePage(1);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                       MySvgWidget(
                         path: ImageAssets.contactUsImage,
                         color:  _page == 2 ?  AppColors.primary : AppColors.grey1,
                         width:  24,
                         height: 24,
                      ),
                      Text(
                        _page == 1 ? "chat".tr() : "",
                        style: TextStyle(
                          color: _page == 1
                              ?  AppColors.primary
                              : AppColors.grey1,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  context.read<NavigatorBottomCubit>().changePage(2);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                       MySvgWidget(
                       path: ImageAssets.contactUsImage,
                      color:  _page == 2 ?  AppColors.primary : AppColors.grey1,
                      width:  24,
                       height: 24,
                      ),
                      Text(
                        _page == 2 ? "orders".tr() : "",
                        style: TextStyle(
                          color: _page == 2
                              ?  AppColors.primary
                              : AppColors.grey1,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  context.read<NavigatorBottomCubit>().changePage(3);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                       MySvgWidget(
                         path: ImageAssets.contactUsImage,
                         color:  _page == 2 ?  AppColors.primary : AppColors.grey1,
                         width:  24,
                         height: 24,
                      ),
                      Text(
                        _page == 3 ? "setting".tr() : "",
                        style: TextStyle(
                          color: _page == 3
                              ?  AppColors.primary
                              : AppColors.grey1,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
