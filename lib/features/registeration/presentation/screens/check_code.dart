import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelamor/core/utils/app_routes.dart';
import 'package:gelamor/features/registeration/presentation/cubit/registration_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/toast_message_method.dart';
import '../../../../core/widgets/circle_image_widget.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/show_loading_indicator.dart';
import '../widgets/header_title.dart';

// ignore: must_be_immutable
class CheckCodeScreen extends StatefulWidget {
  const CheckCodeScreen({Key? key}) : super(key: key);

  @override
  State<CheckCodeScreen> createState() => _CheckCodeScreenState();
}

class _CheckCodeScreenState extends State<CheckCodeScreen> {
  final formKey = GlobalKey<FormState>();
  bool hasError = false;
  StreamController<ErrorAnimationType>? errorController;
  String currentText = "";

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    errorController = StreamController<ErrorAnimationType>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          if (state is RegistrationCheckCodeLoading) {
            return ShowLoadingIndicator();
          }
          if (state is RegistrationCheckCodeLoaded) {
            toastMessage(
              context.read<RegistrationCubit>().message,
              context,
              color: AppColors.success,
            );
            Future.delayed(Duration(milliseconds: 700), () {
              Navigator.pushNamed(
                context,
                Routes.newPasswordRoute,
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
              myWidget: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 80),
                        HeaderTitleWidget(
                          title: AppStrings.resetPasswordTitle,
                          des: AppStrings.resetPasswordDesc,
                        ),
                        const SizedBox(height: 30),
                        Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 30),
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: PinCodeTextField(
                                hintCharacter: '0',
                                pastedTextStyle: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold),
                                appContext: context,
                                length: 6,
                                animationType: AnimationType.fade,
                                validator: (v) {
                                  if (v!.length < 5) {
                                    return "";
                                  } else {
                                    return null;
                                  }
                                },
                                pinTheme: PinTheme(
                                  inactiveColor: AppColors.gray,
                                  activeColor: AppColors.gray,
                                  shape: PinCodeFieldShape.underline,
                                  selectedColor: AppColors.primary,
                                ),
                                cursorColor: AppColors.primary,
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                errorAnimationController: errorController,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    currentText = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            hasError
                                ? AppStrings.resetPasswordValidatorMessage
                                : "",
                            style: TextStyle(
                                color: AppColors.error,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(height: 40),
                        CustomButton(
                          text: AppStrings.doneBtn,
                          color: AppColors.primary,
                          paddingHorizontal: 60,
                          borderRadius: 80,
                          onClick: () {
                            formKey.currentState!.validate();
                            if (currentText.length != 6) {
                              errorController!.add(
                                ErrorAnimationType.shake,
                              ); // Triggering error shake animation
                              setState(() => hasError = true);
                            } else {
                              setState(
                                () {
                                  hasError = false;
                                  context.read<RegistrationCubit>().checkCodeApi(currentText);
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(height: 22),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      ImageAssets.checkCodeImage,
                      height: 180,
                      width: 210,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
