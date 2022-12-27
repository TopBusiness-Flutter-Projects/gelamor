import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/my_svg_widget.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({Key? key}) : super(key: key);

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          SizedBox(width: 4),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isMale = true;
                });
              },
              child: Container(
                color: isMale ? AppColors.genderBackgroundColor : AppColors.primary,
                child: Column(
                  children: [
                    Expanded(
                        child: MySvgWidget(
                      path: ImageAssets.maleIcon,
                      width: null,
                      height: null,
                    )),
                    Text(
                      'Male',
                      style: TextStyle(fontSize: 30, color: AppColors.white),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isMale = false;
                });
              },
              child: Container(
                color: !isMale ? AppColors.genderBackgroundColor : AppColors.primary,
                child: Column(
                  children: [
                    Expanded(
                        child: MySvgWidget(
                      path: ImageAssets.femaleIcon,
                      width: null,
                      height: null,
                    )),
                    Text(
                      'Female',
                      style: TextStyle(fontSize: 30, color: AppColors.white),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 4),
        ],
      ),
    );
  }
}
