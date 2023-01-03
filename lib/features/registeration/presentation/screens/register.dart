import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelamor/core/utils/app_strings.dart';
import 'package:gelamor/features/registeration/presentation/cubit/registration_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/toast_message_method.dart';
import '../../../../core/widgets/circle_image_widget.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/profile_photo.dart';
import '../../../../core/widgets/show_loading_indicator.dart';
import '../widgets/country_picker_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
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
          if (state is RegistrationUpdateUserSuccess) {
            Navigator.pop(context);
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
                        height: context.read<RegistrationCubit>().isUpdate
                            ? 100
                            : 150),
                    context.read<RegistrationCubit>().isUpdate
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ProfilePhotoWidget(
                                imageUrl:
                                    context.read<RegistrationCubit>().imageUrl,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Text(
                                AppStrings.challengeYourselfText,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              SizedBox(height: 12),
                              Text(
                                AppStrings.challengeYourselfDetailsText,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                    SizedBox(height: 22),
                    CustomTextField(
                      controller: context
                          .read<RegistrationCubit>()
                          .registerNameController,
                      title: AppStrings.nameHint,
                      image: 'null',
                      textInputType: TextInputType.text,
                      validatorMessage: AppStrings.nameValidatorMessage,
                    ),
                    SizedBox(height: 22),
                    CustomTextField(
                      controller: context
                          .read<RegistrationCubit>()
                          .registerEmailController,
                      title: AppStrings.emailHint,
                      image: 'null',
                      textInputType: TextInputType.emailAddress,
                      validatorMessage: AppStrings.emailValidatorMessage,
                    ),
                    SizedBox(height: 22),
                    CustomTextField(
                      controller: context
                          .read<RegistrationCubit>()
                          .registerPhoneController,
                      title: AppStrings.phoneHint,
                      image: 'null',
                      textInputType: TextInputType.phone,
                      validatorMessage: AppStrings.phoneValidatorMessage,
                    ),
                    context.read<RegistrationCubit>().isUpdate
                        ? Container()
                        : SizedBox(height: 22),
                    context.read<RegistrationCubit>().isUpdate
                        ? Container()
                        : CountryPickerWidget(),
                    SizedBox(height: 22),
                    CustomTextField(
                      controller: context
                          .read<RegistrationCubit>()
                          .registerLocationController,
                      title: AppStrings.locationHint,
                      image: 'null',
                      textInputType: TextInputType.text,
                      validatorMessage: AppStrings.locationValidatorMessage,
                    ),
                    SizedBox(height: 22),
                    CustomTextField(
                      controller: context
                          .read<RegistrationCubit>()
                          .registerPasswordController,
                      title: AppStrings.passwordHint,
                      image: 'null',
                      isPassword: true,
                      textInputType: TextInputType.text,
                      validatorMessage:
                          context.read<RegistrationCubit>().isUpdate
                              ? "no valid"
                              : AppStrings.passwordValidationMessage,
                    ),
                    SizedBox(height: 22),
                    CustomTextField(
                      controller: context
                          .read<RegistrationCubit>()
                          .registerConfirmPasswordController,
                      title: AppStrings.confirmPasswordHint,
                      isPassword: true,
                      image: 'null',
                      textInputType: TextInputType.text,
                      validatorMessage:
                          context.read<RegistrationCubit>().isUpdate
                              ? "no valid"
                              : AppStrings.confirmPasswordValidationMessage,
                    ),
                    SizedBox(height: 40),
                    CustomButton(
                      text: context.read<RegistrationCubit>().isUpdate
                          ? AppStrings.updateBtn
                          : AppStrings.signUpBtn,
                      color: AppColors.primary,
                      onClick: () {
                        if (context.read<RegistrationCubit>().isUpdate) {
                          if (formKey.currentState!.validate()) {
                            print('tttttttttttttttttttttt');
                              context.read<RegistrationCubit>().userUpdate();
                          }
                        } else {
                          if (formKey.currentState!.validate()) {
                            if (context
                                    .read<RegistrationCubit>()
                                    .registerPasswordController
                                    .text !=
                                context
                                    .read<RegistrationCubit>()
                                    .registerConfirmPasswordController
                                    .text) {
                              toastMessage(
                                AppStrings.checkPasswordMessage,
                                context,
                                color: AppColors.error,
                              );
                            } else if (context
                                    .read<RegistrationCubit>()
                                    .countryId ==
                                0) {
                              toastMessage(
                                AppStrings.selectCountryMessage,
                                context,
                                color: AppColors.error,
                              );
                            } else {
                              context.read<RegistrationCubit>().userRegister();
                            }
                          }
                        }
                      },
                      paddingHorizontal: 60,
                      borderRadius: 80,
                    ),
                    SizedBox(height: 25),
                    context.read<RegistrationCubit>().isUpdate
                        ? Container()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppStrings.alreadyHaveAccountText),
                              TextButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, Routes.loginRoute),
                                child: Text(AppStrings.signInBtn),
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      AppColors.primary, // Text Color
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
