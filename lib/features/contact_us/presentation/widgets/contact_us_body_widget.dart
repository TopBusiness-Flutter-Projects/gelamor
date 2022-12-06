import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../cubit/contact_us_cubit.dart';

class ContactUsBodyWidget extends StatelessWidget {
  ContactUsBodyWidget({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      ImageAssets.contactUsImage,
                      width: 215,
                      height: 136,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CustomTextField(
                image: ImageAssets.accountPersonIcon,
                imageColor: AppColors.primary,
                title: 'translateText(AppStrings.nameHint, context)',
                textInputType: TextInputType.text,
                controller: context.read<ContactUsCubit>().nameController,
                validatorMessage: 'translateText(AppStrings.nameValidatorMessage,context,)',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                image: ImageAssets.emailIcon,
                imageColor: AppColors.primary,
                title: 'translateText(AppStrings.emailHint, context)',
                textInputType: TextInputType.emailAddress,
                controller: context.read<ContactUsCubit>().emailController,
                validatorMessage: 'translateText(AppStrings.emailValidatorMessage, context,)',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                image: ImageAssets.rewriteIcon,
                imageColor: AppColors.primary,
                title: 'translateText(AppStrings.subjectHint, context)',
                textInputType: TextInputType.text,
                controller: context.read<ContactUsCubit>().subjectController,
                validatorMessage: 'translateText(AppStrings.subjectValidatorMessage, context,)',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                image: ImageAssets.rewriteIcon,
                imageColor: AppColors.primary,
                title: 'translateText(AppStrings.messageHint, context,)',
                textInputType: TextInputType.text,
                minLine: 6,
                controller: context.read<ContactUsCubit>().messageController,
                validatorMessage: 'translateText(AppStrings.messageValidatorMessage, context,)',
              ),
              const SizedBox(height: 60),
              CustomButton(
                text: 'translateText(AppStrings.sendBtn, context)',
                color: AppColors.primary,
                onClick: () {
                  if (formKey.currentState!.validate()) {
                    context.read<ContactUsCubit>().postContactUs();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
