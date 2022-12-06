part of 'contact_us_cubit.dart';

@immutable
abstract class ContactUsState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ContactUsInitial extends ContactUsState {}

class ContactUsLoading extends ContactUsState {}
class ContactUsLoaded extends ContactUsState {
  final ContactUsModel contactUsModel;

  ContactUsLoaded(this.contactUsModel);
  @override
  List<Object?> get props => [
    contactUsModel
  ];
}
class ContactUsError extends ContactUsState {

  final String message;

  ContactUsError(this.message);
  @override
  List<Object?> get props => [
    message
  ];
}
