import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/snackbar_method.dart';
import '../../../../core/widgets/show_loading_indicator.dart';
import '../cubit/contact_us_cubit.dart';
import '../widgets/contact_us_body_widget.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Center(
          child: Text(
            AppStrings.contactUsText,
            style: TextStyle(color: AppColors.black),
          ),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: BlocBuilder<ContactUsCubit, ContactUsState>(
        builder: (context, state) {
          if(state is ContactUsLoading){
            return const ShowLoadingIndicator();
          }else if(state is ContactUsError){
            Future.delayed(const Duration(milliseconds: 400), () {
              snackBar(
                AppStrings.errorMessage,
                context,
                color: AppColors.error,
              );
            });
            return ContactUsBodyWidget();
          }else if(state is ContactUsLoaded){
            Future.delayed(
              const Duration(milliseconds: 400),
                  () {
                Navigator.of(context).pop();
              },
            );
            return const ShowLoadingIndicator();
          }
          return ContactUsBodyWidget();
        },
      ),
    );
  }
}
