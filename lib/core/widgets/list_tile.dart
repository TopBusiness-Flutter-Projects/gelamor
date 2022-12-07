import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';
import '../utils/assets_manager.dart';

class MyListTile extends StatelessWidget {
  const MyListTile(
      {Key? key,
      required this.image,
      required this.text,
      required this.onClick})
      : super(key: key);
  final String image;
  final String text;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    String lang = EasyLocalization.of(context)!.locale.languageCode;

    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            SvgPicture.asset(
              image,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Text(
                text,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16.0,
                    color: image == ImageAssets.deleteAccountIcon
                        ? AppColors.error
                        : AppColors.black),
              ),
            ),
            Expanded(
                child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: image == ImageAssets.deleteAccountIcon
                  ? const SizedBox(width: 0)
                  : Icon(
                      lang == 'ar'
                          ? Icons.keyboard_arrow_right_rounded
                          : Icons.keyboard_arrow_left_rounded,
                      color: AppColors.primary,
                    ),
            )),
          ],
        ),
      ),
    );
  }
}
