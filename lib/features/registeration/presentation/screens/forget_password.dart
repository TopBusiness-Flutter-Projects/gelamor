import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelamor/core/utils/app_strings.dart';
import 'package:gelamor/features/registeration/presentation/cubit/registration_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/toast_message_method.dart';
import '../../../../core/widgets/circle_image_widget.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/show_loading_indicator.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          if(state is RegistrationSendEmailLoading){
            return ShowLoadingIndicator();
          }
          if (state is RegistrationSendEmailLoaded) {
            toastMessage(
              context.read<RegistrationCubit>().message,
              context,
              color: AppColors.success,
            );
            Future.delayed(Duration(milliseconds: 700),(){
              Navigator.pushNamed(context, Routes.checkCodeRoute);
            });
            return ShowLoadingIndicator();
          }
          if (state is RegistrationLoginError) {
            toastMessage(
              context.read<RegistrationCubit>().message,
              context,
              color: AppColors.error,
            );
          }
          return SafeArea(
            child: CircleImageWidget(
                myWidget: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Text(
                      AppStrings.forgetPasswordBtn,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(height: 35),
                    Image.asset(
                      ImageAssets.forgotPwImage,
                      width: 250,
                      height: 250,
                    ),
                    SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: CustomTextField(
                        controller: emailController,
                        title: AppStrings.emailHint,
                        image: 'null',
                        textInputType: TextInputType.emailAddress,
                        validatorMessage: AppStrings.emailValidatorMessage,
                      ),
                    ),
                    SizedBox(height: 40),
                    CustomButton(
                      text: AppStrings.sendBtn,
                      color: AppColors.primary,
                      onClick: () {
                        if (formKey.currentState!.validate()) {
                          context
                              .read<RegistrationCubit>()
                              .forgetPasswordApi(emailController.text);
                          // print('all is well !!');
                        }
                      },
                      paddingHorizontal: 60,
                      borderRadius: 80,
                    ),
                    SizedBox(height: 18),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.signInBtn,
                        style: TextStyle(fontSize: 16),
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primary, // Text Color
                      ),
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
