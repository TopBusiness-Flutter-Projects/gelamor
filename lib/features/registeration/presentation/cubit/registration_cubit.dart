import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/remote/handle_exeption.dart';
import '../../../../core/remote/service.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/toast_message_method.dart';
import '../../../navigation_bottom/cubit/navigator_bottom_cubit.dart';
import '../../models/login_model.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this.serviceApi) : super(RegistrationInitial()) {
    countriesList();
  }

  final ServiceApi serviceApi;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();
  TextEditingController registerLocationController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerConfirmPasswordController =
      TextEditingController();

  XFile? image;
  int code = 0;
  String message = '';
  bool isCountriesDropdown = false;
  bool isUpdate = false;
  String imageUrl = '';
  int countryId = 0;
  String checkCode = '';
  String token = '';

  List<String> countriesListData = [];

/////////////// Methods /////////////////
  storeUser(LoginModel loginModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(loginModel));
  }

  errorMessage(String message, int code) {
    this.message = message;
    this.code = code;
    emit(RegistrationLoginErrorMessages());
    Future.delayed(Duration(milliseconds: 500), () {
      this.message = '';
      this.code = 0;
      emit(RegistrationInitial());
    });
  }

  successfullyLogin(BuildContext context) {
    toastMessage(
      context.read<RegistrationCubit>().message,
      context,
      color: AppColors.success,
    );
    Future.delayed(Duration(milliseconds: 400), () {
      context.read<NavigatorBottomCubit>().page = 0;
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.initialRoute,
        ModalRoute.withName(Routes.loginRoute),
      );
    }).whenComplete(
      () => emit(RegistrationInitial()),
    );
  }

  putDataToUpdate(LoginModel loginModel) {
    isUpdate = true;
    token= loginModel.user!.token!;
    imageUrl = loginModel.user!.img!;
    registerNameController.text = loginModel.user!.name!;
    registerEmailController.text = loginModel.user!.email!;
    registerPhoneController.text = loginModel.user!.phone!;
    registerLocationController.text = loginModel.user!.location!;
    registerLocationController.text = loginModel.user!.location!;
  }

//////////////////////////////////////

  userLogin() async {
    emit(RegistrationLoginLoading());
    try {
      final response = await serviceApi.userLogin(
        emailController.text,
        passwordController.text,
      );
      if (response.code == 200) {
        code = response.code!;
        message = response.message!;
        storeUser(response);
        emit(RegistrationLoginLoaded());
      } else if (response.code == 406) {
        errorMessage(response.message!, response.code!);
      }
    } on DioError catch (e) {
      print(" Error : ${e}");
      final errorMessage = DioExceptions.fromDioError(e).toString();
      emit(RegistrationLoginError());
      throw errorMessage;
    }
  }

  userRegister() async {
    emit(RegistrationLoginLoading());
    try {
      final response = await serviceApi.userRegister(
        User(
          email: registerEmailController.text,
          password: registerPasswordController.text,
          name: registerNameController.text,
          phone: registerPhoneController.text,
          location: registerLocationController.text,
          countryId: countryId,
        ),
      );
      if (response.code == 200) {
        code = response.code!;
        message = response.message!;
        storeUser(response);
        emit(RegistrationLoginLoaded());
      } else {
        errorMessage(response.message!, response.code!);
      }
    } on DioError catch (e) {
      print(" Error : ${e}");
      final errorMessage = DioExceptions.fromDioError(e).toString();
      emit(RegistrationLoginError());
      throw errorMessage;
    }
  }

  userUpdate() async {
    emit(RegistrationLoginLoading());
    try {
      final response = await serviceApi.userUpdateProfile(
        User(
          token: token,
          email: registerEmailController.text,
          password: registerPasswordController.text.isNotEmpty
              ? registerPasswordController.text
              : null,
          name: registerNameController.text,
          phone: registerPhoneController.text,
          location: registerLocationController.text,
          img: image != null ? image!.path : null,
        ),
      );
      if (response.code == 200) {
        // code = response.code!;
        // message = response.message!;
        // storeUser(response);
        emit(RegistrationUpdateUserSuccess());
      } else {
        errorMessage(response.message, response.code);
      }
    } on DioError catch (e) {
      print(" Error : ${e}");
      final errorMessage = DioExceptions.fromDioError(e).toString();
      emit(RegistrationLoginError());
      throw errorMessage;
    }
  }

//////////////////////////////////////

  countriesList() async {
    emit(RegistrationCountriesLoading());
    final response = await serviceApi.countriesList();
    if (response.status == 200) {
      response.countries!.forEach((element) {
        countriesListData.add("${element.name!}/${element.id}/");
      });
      isCountriesDropdown = true;
      emit(RegistrationCountriesLoaded());
    } else {
      emit(RegistrationCountriesError());
    }
  }

  ////////////// Reset Password //////////////

  forgetPasswordApi(String email) async {
    emit(RegistrationSendEmailLoading());
    try {
      final response = await serviceApi.forgetPasswordApi(email);
      if (response.code == 200) {
        code = response.code;
        message = response.message;
        emit(RegistrationSendEmailLoaded());
      } else {
        errorMessage(response.message, response.code);
      }
    } on DioError catch (e) {
      print(" Error : ${e}");
      final errorMessage = DioExceptions.fromDioError(e).toString();
      emit(RegistrationSendEmailError());
      throw errorMessage;
    }
  }

  checkCodeApi(String checkCode) async {
    emit(RegistrationCheckCodeLoading());
    try {
      final response = await serviceApi.checkCode(checkCode);
      if (response.code == 200) {
        code = response.code;
        message = response.message;
        this.checkCode = response.checkCode;
        emit(RegistrationCheckCodeLoaded());
      } else {
        errorMessage(response.message, response.code);
      }
    } on DioError catch (e) {
      print(" Error : ${e}");
      final errorMessage = DioExceptions.fromDioError(e).toString();
      emit(RegistrationCheckCodeError());
      throw errorMessage;
    }
  }

  resetPasswordApi(String password) async {
    emit(RegistrationResetPasswordLoading());
    try {
      final response = await serviceApi.resetPassword(password, checkCode);
      if (response.code == 200) {
        code = response.code;
        message = response.message;
        emit(RegistrationResetPasswordLoaded());
      } else {
        errorMessage(response.message, response.code);
      }
    } on DioError catch (e) {
      print(" Error : ${e}");
      final errorMessage = DioExceptions.fromDioError(e).toString();
      emit(RegistrationResetPasswordError());
      throw errorMessage;
    }
  }
}
