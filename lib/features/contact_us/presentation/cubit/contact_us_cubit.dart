import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/remote/service.dart';
import '../../data/models/contact_us_data_model.dart';
import '../../domain/entities/send_contact_us_data_model.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit(this.serviceApi) : super(ContactUsInitial());

  final ServiceApi serviceApi;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  Future<void> postContactUs() async {
    emit(ContactUsLoading());
    final response = await serviceApi.contactUsApi(
      SendContactUsModel(
        name: nameController.text,
        email: emailController.text,
        message: messageController.text,
        subject: subjectController.text,
      ),
    );

    if (response.code == 200) {
      ContactUsLoaded(response);
      Future.delayed(
        const Duration(milliseconds: 700),
        () {
          emit(messageSendSuccessfully());
        },
      );
    } else {
      emit(ContactUsError(response.message));
    }
  }

  messageSendSuccessfully() {
    emit(ContactUsInitial());
  }
}
