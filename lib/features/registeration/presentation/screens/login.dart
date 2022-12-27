import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelamor/core/utils/app_strings.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/toast_message_method.dart';
import '../../../../core/widgets/circle_image_widget.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/show_loading_indicator.dart';
import '../../../navigation_bottom/cubit/navigator_bottom_cubit.dart';
import '../cubit/registration_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          if (state is RegistrationLoginErrorMessages) {
            toastMessage(
              context.read<RegistrationCubit>().message,
              context,
              color: AppColors.error,
            );
          }
          if (state is RegistrationLoginError) {
            toastMessage(
              context.read<RegistrationCubit>().message,
              context,
              color: AppColors.error,
            );
          }
          if (state is RegistrationLoginLoaded) {
            context.read<RegistrationCubit>().successfullyLogin(context);
            return ShowLoadingIndicator();
          }
          if (state is RegistrationLoginLoading) {
            return ShowLoadingIndicator();
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
                      AppStrings.welcomeBackText,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(height: 35),
                    Image.asset(
                      ImageAssets.loginImage,
                      width: 250,
                      height: 250,
                    ),
                    SizedBox(height: 22),
                    CustomTextField(
                      controller:
                          context.read<RegistrationCubit>().emailController,
                      title: AppStrings.emailHint,
                      image: 'null',
                      textInputType: TextInputType.emailAddress,
                      validatorMessage: AppStrings.emailValidatorMessage,
                    ),
                    SizedBox(height: 22),
                    CustomTextField(
                      controller:
                          context.read<RegistrationCubit>().passwordController,
                      title: AppStrings.passwordHint,
                      image: 'null',
                      isPassword: true,
                      textInputType: TextInputType.text,
                      validatorMessage: AppStrings.passwordValidationMessage,
                    ),
                    SizedBox(height: 40),
                    CustomButton(
                      text: AppStrings.signInBtn,
                      color: AppColors.primary,
                      onClick: () {
                        if (formKey.currentState!.validate()) {
                          context.read<RegistrationCubit>().userLogin();
                          print('all is well !!');
                        }
                      },
                      paddingHorizontal: 60,
                      borderRadius: 80,
                    ),
                    SizedBox(height: 18),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, Routes.forgetPasswordRoute),
                      child: Text(
                        AppStrings.forgetPasswordBtn,
                        style: TextStyle(fontSize: 16),
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primary, // Text Color
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.doNotHaveAccountText),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(
                              context, Routes.registerRoute),
                          child: Text(AppStrings.signUpBtn),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.primary, // Text Color
                          ),
                        )
                      ],
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
