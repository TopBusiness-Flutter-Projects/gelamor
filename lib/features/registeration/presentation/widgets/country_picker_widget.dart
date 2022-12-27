import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelamor/core/utils/app_colors.dart';

import '../../../../core/utils/app_strings.dart';
import '../cubit/registration_cubit.dart';
import 'dropdown_search.dart';

class CountryPickerWidget extends StatefulWidget {
  CountryPickerWidget({Key? key}) : super(key: key);

  @override
  State<CountryPickerWidget> createState() => _CountryPickerWidgetState();
}

class _CountryPickerWidgetState extends State<CountryPickerWidget> {
  String text = 'Select Your Country';

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (BuildContext context, state) {
          if (state is RegistrationCountriesLoading) {
            return Stack(
              children: [
                DropdownSearchWidget(
                  isEnable: context.read<RegistrationCubit>().isCountriesDropdown,
                  update: 'loading',
                  labelText:
                  AppStrings.selectCountryText,
                  icon: Icons.location_on,
                  dropdownList: context.read<RegistrationCubit>().countriesListData,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            );
          } else if (state is RegistrationCountriesLoaded) {
            return DropdownSearchWidget(
              isEnable: context.read<RegistrationCubit>().isCountriesDropdown,
              labelText: AppStrings.selectCountryText,
              icon: Icons.location_on,
              dropdownList: context.read<RegistrationCubit>().countriesListData,
            );
          } else if (state is RegistrationCountriesError) {
            return Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 120,
                  child: DropdownSearchWidget(
                    isEnable: context.read<RegistrationCubit>().isCountriesDropdown,
                    labelText:
                    AppStrings.selectCountryText,
                    icon: Icons.location_on,
                    dropdownList: context.read<RegistrationCubit>().countriesListData,
                  ),
                ),
                SizedBox(
                  width: 64,
                  height: 64,
                  child: IconButton(
                    onPressed: () {
                      context.read<RegistrationCubit>().countriesList();
                    },
                    icon: Icon(
                      Icons.refresh,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return DropdownSearchWidget(
              isEnable: context.read<RegistrationCubit>().isCountriesDropdown,
              labelText: AppStrings.selectCountryText,
              icon: Icons.location_on,
              dropdownList: context.read<RegistrationCubit>().countriesListData,
            );
          }
        },
      ),
    );




    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownSearchWidget(
        dropdownList: ['yehia/1', 'ahmad/2'],
        labelText: 'Select Country',
        isEnable: true,
        icon: Icons.location_on_outlined,
      ),
    );
  }
}
