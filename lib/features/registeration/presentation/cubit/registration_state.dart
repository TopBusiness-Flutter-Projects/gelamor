part of 'registration_cubit.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoginLoading extends RegistrationState {}
class RegistrationLoginLoaded extends RegistrationState {}
class RegistrationLoginError extends RegistrationState {}
class RegistrationLoginErrorMessages extends RegistrationState {}

class RegistrationCountriesLoading extends RegistrationState {}
class RegistrationCountriesLoaded extends RegistrationState {}
class RegistrationCountriesError extends RegistrationState {}


class RegistrationSendEmailLoading extends RegistrationState {}
class RegistrationSendEmailLoaded extends RegistrationState {}
class RegistrationSendEmailError extends RegistrationState {}


class RegistrationCheckCodeLoading extends RegistrationState {}
class RegistrationCheckCodeLoaded extends RegistrationState {}
class RegistrationCheckCodeError extends RegistrationState {}

class RegistrationResetPasswordLoading extends RegistrationState {}
class RegistrationResetPasswordLoaded extends RegistrationState {}
class RegistrationResetPasswordError extends RegistrationState {}
