import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelamor/core/utils/app_colors.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({Key? key, required this.title, required this.path, required this.padding})
      : super(key: key);
  final String title;
  final String path;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: <Widget>[

      Image.asset(path,width: double.maxFinite,
      fit: BoxFit.fitWidth,
      ),
      Padding(

           padding: EdgeInsets.fromLTRB(20,padding,20,20),
           child: Text(
            
        title,
        style: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      )),
    ]));
  }
}
