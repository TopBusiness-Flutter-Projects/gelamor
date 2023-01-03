import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gelamor/core/remote/service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/models/user_statistic_model.dart';
import '../../../../core/remote/handle_exeption.dart';
import '../../../registeration/models/login_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.serviceApi) : super(ProfileInitial()) {
    _getStoreUser().then((value) => getUserStatistic());
  }

  late LoginModel loginDataModel;
  final ServiceApi serviceApi;
  List<StatisticDatum>? statisticList;
  int maxCalories = 0;

  Future<void> _getStoreUser() async {
    emit(ProfileUserLoading());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user') != null) {
      Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
      LoginModel loginDataModel = LoginModel.fromJson(userMap);
      this.loginDataModel = loginDataModel;
      emit(ProfileUserLoaded());
    }
  }

  Future<void> clearSharedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    emit(ProfileInitial());
  }

  logoutUser() async {
    try {
      emit(ProfileLogoutLoading());
      final response = await serviceApi.logoutUser(loginDataModel.user!.token!);
      if (response.code == 200) {
        emit(ProfileLogoutLoaded());
      } else {
        emit(ProfileLogoutError());
      }
    } on DioError catch (e) {
      print(" Error : ${e}");
      final errorMessage = DioExceptions.fromDioError(e).toString();
      emit(ProfileLogoutError());
      throw errorMessage;
    }
  }

  getUserStatistic() async {
    try {
      emit(ProfileStatisticLoading());
      final response =
          await serviceApi.userStatistics(loginDataModel.user!.token!);
      if (response.code == 200) {
        statisticList = response.data;
        response.data!.forEach((element) {
          if (element.calories! > maxCalories) {
            maxCalories = element.calories! + 100;
          }
        });
        emit(ProfileStatisticLoaded());
      } else {
        emit(ProfileStatisticError());
      }
    } on DioError catch (e) {
      print(" Error : ${e}");
      final errorMessage = DioExceptions.fromDioError(e).toString();
      emit(ProfileStatisticError());
      throw errorMessage;
    }
  }
}
