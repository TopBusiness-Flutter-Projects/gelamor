part of 'packages_cubit.dart';

@immutable
abstract class PackagesState {}

class PackagesInitial extends PackagesState {}

class AllPackagesLoading extends PackagesState {}
class AllPackagesLoaded extends PackagesState {
  final List<PackagesDatum> packagesDatum;

  AllPackagesLoaded(this.packagesDatum);
}
class AllPackagesError extends PackagesState {}
