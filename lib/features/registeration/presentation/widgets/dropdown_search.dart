import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelamor/features/registeration/presentation/cubit/registration_cubit.dart';
import '../../../../core/utils/app_colors.dart';

class DropdownSearchWidget extends StatelessWidget {
  const DropdownSearchWidget({
    Key? key,
    required this.dropdownList,
    required this.icon,
    required this.labelText,
    required this.isEnable,
    this.kind = "null",
    this.update = "null",
  }) : super(key: key);
  final List<String> dropdownList;
  final IconData icon;
  final String labelText;
  final bool isEnable;
  final String? kind;
  final String? update;

  @override
  Widget build(BuildContext context) {
    List<String> names = [];
    List<String> ids = [];
    for (var element in dropdownList) {
      names.add(element.split("/")[0]);
      ids.add(element.split("/")[1]);
    }

    return Theme(
      data: ThemeData(
        backgroundColor: AppColors.white,
        textTheme: const TextTheme(
          subtitle1: TextStyle(fontSize: 14),
        ),
      ),
      child: DropdownSearch<String>(
        popupProps: const PopupProps.menu(
          showSelectedItems: true,
          fit: FlexFit.loose,
        ),
        enabled: isEnable,
        items: names,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            filled: true,
            enabled: true,
            isCollapsed: false,
            hintText: labelText,
            iconColor: AppColors.primary,
            focusColor: AppColors.primary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: icon == Icons.abc
                ? null
                : Icon(
                    icon,
                    color: AppColors.gray,
                  ),
          ),
        ),
        autoValidateMode: AutovalidateMode.always,
        onChanged: (text) {
          for (var element in dropdownList) {
            if (element.contains(text!)) {
              context.read<RegistrationCubit>().countryId =
                  int.parse(element.split("/")[1]);
            }
          }
        },
      ),
    );
  }
}
