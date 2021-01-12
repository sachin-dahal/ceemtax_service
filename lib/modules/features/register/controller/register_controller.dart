import 'package:ceemtax_service/modules/features/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends LoginController {
  TextEditingController idTextController;
  TextEditingController pw1TextController;
  TextEditingController pw2TextController;

  @override
  void onInit() {
    super.onInit();
    idTextController = TextEditingController();
    pw1TextController = TextEditingController();
    pw2TextController = TextEditingController();
  }

  bool fieldValidation(String email, String password) {
    return super.fieldValidation(email, password);
  }

  bool reTypePasswordValidation(String password1, String password2) {
    if (password1 != password2) {
      Get.snackbar("Sorry!", "Password didn't matched",
          snackPosition: SnackPosition.BOTTOM,
          backgroundGradient: LinearGradient(
            colors: [Colors.green, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ));
      return false;
    }
    return true;
  }

  // bool pw = reTypePasswordValidation(
  //   pw1TextController.text,
  //   pw2TextController.text,
  // );

  // bool field = fieldValidation(
  //   idTextController.text,
  //   pw1TextController.text,
  // );

  // register process here

  //

  @override
  void onClose() {
    super.onClose();
    idTextController.dispose();
    pw1TextController.dispose();
    pw2TextController.dispose();
  }
}
