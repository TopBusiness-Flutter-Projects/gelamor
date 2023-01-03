part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLogoutLoading extends ProfileState {}
class ProfileLogoutLoaded extends ProfileState {}
class ProfileLogoutError extends ProfileState {}

class ProfileUserLoading extends ProfileState {}
class ProfileUserLoaded extends ProfileState {}

class ProfileStatisticLoading extends ProfileState {}
class ProfileStatisticLoaded extends ProfileState {}
class ProfileStatisticError extends ProfileState {}
