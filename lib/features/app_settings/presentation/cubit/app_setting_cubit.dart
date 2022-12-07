import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/remote/service.dart';
import '../../data/models/app_setting_data_model.dart';

part 'app_setting_state.dart';

class AppSettingCubit extends Cubit<AppSettingState> {
  AppSettingCubit(this.serviceApi) : super(AppSettingInitial()) {
    getAllAppSettingData();
  }

  final ServiceApi serviceApi;

  getAllAppSettingData() async {
    emit(AppSettingLoading());
    final response = await serviceApi.appSettingsApi();
    if (response.code == 200) {
      emit(AppSettingLoaded(response));
    } else {
      emit(AppSettingError(response.message!));
    }

    // Either<Failure, AppSettingModel> response =
    //     await getAppSettingUseCase(NoParams());
    // emit(
    //   response.fold(
    //     (failure) => AppSettingError(
    //       MapFailureMessage.mapFailureToMessage(failure),
    //     ),
    //     (appSettingModel) => AppSettingLoaded(appSettingModel),
    //   ),
    // );
  }
}
