import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelamor/features/registeration/presentation/cubit/registration_cubit.dart';
import 'package:gelamor/features/registeration/presentation/cubit/registration_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/snackbar_method.dart';
import '../../../../core/utils/toast_message_method.dart';
import '../../../../core/widgets/circle_image_widget.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/show_loading_indicator.dart';

class NewPassword extends StatelessWidget {
  NewPassword({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {

          if (state is RegistrationResetPasswordLoading) {
            return ShowLoadingIndicator();
          }
          if (state is RegistrationResetPasswordLoaded) {
            toastMessage(
              context.read<RegistrationCubit>().message,
              context,
              color: AppColors.success,
            );
            Future.delayed(Duration(milliseconds: 700), () {
              Navigator.pushNamed(
                context,
                Routes.initialRoute,
              );
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
                    const SizedBox(height: 150),
                    Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            ImageAssets.newPasswordImage,
                            width: 210,
                            height: 150,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Text(AppStrings.newPasswordTitle),
                    const SizedBox(height: 32),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: passwordController,
                      image: 'null',
                      title: AppStrings.passwordHint,
                      validatorMessage: AppStrings.passwordValidationMessage,
                      isPassword: true,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: confirmPasswordController,
                      image: 'null',
                      title: AppStrings.confirmPasswordHint,
                      isPassword: true,
                      validatorMessage:
                          AppStrings.confirmPasswordValidatorMessage,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 48),
                    CustomButton(
                      paddingHorizontal: 65,
                      borderRadius: 80,
                      text: AppStrings.confirmBtn,
                      color: AppColors.primary,
                      onClick: () {
                        if (formKey.currentState!.validate()) {
                          if (passwordController.text !=
                              confirmPasswordController.text) {
                            snackBar(
                                AppStrings.passwordValidationMessage, context,
                                color: AppColors.error);
                          } else {
                            print('========00000=======');
                            context
                                .read<RegistrationCubit>()
                                .resetPasswordApi(passwordController.text);
                          }
                        }
                      },
                    ),
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
