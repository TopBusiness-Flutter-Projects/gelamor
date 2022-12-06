
import '../models/contact_us_data_model.dart';

abstract class BaseContactUsDataSource {
  Future<ContactUsModel> postContactUs(ContactUsDataModel contactUsDataModel);
}

class ContactUsDataSource extends BaseContactUsDataSource {
  // final BaseApiConsumer baseApiConsumer;

  ContactUsDataSource();

  @override
  Future<ContactUsModel> postContactUs(ContactUsDataModel contactUsDataModel) {
    // TODO: implement postContactUs
    throw UnimplementedError();
  }
  // ContactUsDataSource(this.baseApiConsumer);

  // @override
  // Future<ContactUsModel> postContactUs(
  //     ContactUsDataModel contactUsDataModel) async {
  //   // final response = await baseApiConsumer.post(EndPoints.contactUsUrl, body: {
  //   //   "name": contactUsDataModel.name,
  //   //   "email": contactUsDataModel.email,
  //   //   "subject": contactUsDataModel.subject,
  //   //   "message": contactUsDataModel.message,
  //   // });
  //   return ContactUsModel.fromJson(response);
  // }
}
