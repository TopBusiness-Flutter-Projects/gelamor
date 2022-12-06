import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/app_setting_data_model.dart';

part 'app_setting_state.dart';

class AppSettingCubit extends Cubit<AppSettingState> {
  AppSettingCubit()
      : super(AppSettingInitial()){
    getAllAppSettingData();
  }

  // final GetAppSettingsUseCase getAppSettingUseCase;

  getAllAppSettingData() async {
    emit(AppSettingLoading());
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
