import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/remote/service.dart';
import '../../../registeration/models/login_model.dart';
import '../../models/all_packages_model.dart';

part 'packages_state.dart';

class PackagesCubit extends Cubit<PackagesState> {
  PackagesCubit(this.api) : super(PackagesInitial()) {
    _getStoreUser().then((value) => getAllPackagesApi());
  }

  final ServiceApi api;

  late LoginModel loginModel;
  List<PackagesDatum> packagesList = [];
  int packagesListLength = 0;
  String lan='';

  Future<void> _getStoreUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user') != null) {
      lan = (await prefs.getString('lan'))!;
      Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
      LoginModel loginDataModel = LoginModel.fromJson(userMap);
      this.loginModel = loginDataModel;
    }
  }

  getAllPackagesApi() async {
    packagesListLength=1;
    emit(AllPackagesLoading());
    final response = await api.allPackageApis(loginModel.user!.token!,lan);
    if (response.code == 200) {
      print(response.data);
      packagesListLength = response.data!.length;
      packagesList = response.data!;
      emit(AllPackagesLoaded(packagesList));
    } else {
      print(response.message);
      emit(AllPackagesError());
    }
  }
}
