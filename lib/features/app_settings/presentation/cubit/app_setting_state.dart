part of 'app_setting_cubit.dart';

abstract class AppSettingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppSettingInitial extends AppSettingState {}

class AppSettingLoaded extends AppSettingState {
  final AppSettingModel appSettingModel;

  AppSettingLoaded(this.appSettingModel);

  @override
  List<Object?> get props => [appSettingModel];
}

class AppSettingLoading extends AppSettingState {}

class AppSettingError extends AppSettingState {
  final String message;

  AppSettingError(this.message);

  @override
  List<Object?> get props => [message];
}
