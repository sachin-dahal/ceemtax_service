import 'dart:io';

import 'package:ceemtax_service/core/modules/base_page_controller.dart';
import 'package:ceemtax_service/core/services/form_image_service.dart';
import 'package:ceemtax_service/core/services/form_service.dart';
import 'package:ceemtax_service/data_source/form_details/models/form.dart';
import 'package:get_storage/get_storage.dart';

class FormPageController extends BasePageController {
  FormService _formService = FormService();
  FormImageService _formImageService = FormImageService();
  GetStorage box = GetStorage();

  FormModel getFormModel() => FormModel(
        firstName: formData[0],
        middleName: formData[1],
        lastName: formData[2],
        dateOfBirth: formData[3],
        ssn: formData[4],
        numberOfDependents: formData[5],
        driverLicenseId: formData[6],
        idIssueDate: formData[7],
        idExpiryDate: formData[8],
        occupation: formData[9],
        address1: formData[10],
        address2: formData[11],
        zipCode: formData[12],
        city: formData[13],
        state: formData[14],
        phoneNumber: formData[15],
        email: formData[16],
        payment: formData[17],
        comment: formData[18],
      );
  //------------------------------------
  // Form Details
  //------------------------------------
  List<String> formData = [];
  List<String> getFormData(List<String> formDataHere) {
    formData = formDataHere;
    update();
    return formData;
  }

  //------------------------------------
  // Form Image
  //------------------------------------
  List<File> imageData = [];
  List<File> getImageData(List<dynamic> imageDataHere) {
    imageData = imageDataHere;
    update();
    return imageData;
  }

  //------------------------------------
  // FORM Submission
  //------------------------------------
  submitForm() async {
    String _uid = box.read("uid");
    return await _formService.submitForm(getFormModel(), _uid);
  }

  //------------------------------------
  // IMAGE Submission
  //------------------------------------
  submitImage(List<File> file) async {
    update();
    file.forEach((e) {
      return _formImageService.upload(e);
    });
    setLoading(false);
    update();
  }
}
