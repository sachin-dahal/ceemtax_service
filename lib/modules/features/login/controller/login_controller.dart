import 'package:ceemtax_service/core/modules/base_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends BasePageController {
  TextEditingController idController;
  TextEditingController pwController;

  @override
  void onInit() {
    super.onInit();
    idController = TextEditingController();
    pwController = TextEditingController();
  }

  // validation
  bool fieldValidation(String email, String password) {
    if (email.isEmpty && password.isEmpty) {
      _errorSnackbar(errorMsg: "Empty fields detected!");
      return false;
    } else {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);

      bool pwValid = password.length > 6;

      if (!emailValid) {
        _errorSnackbar(errorMsg: "Please enter a valid email");
        return false;
      }

      if (!pwValid) {
        _errorSnackbar(errorMsg: "Password must be more then 6 Characters");
        return false;
      }
      return true;
    }
  }

  // sign in with firebase

  //

  _errorSnackbar({String errorMsg}) {
    return Get.snackbar("Sorry!", errorMsg,
        snackPosition: SnackPosition.BOTTOM,
        backgroundGradient: LinearGradient(
          colors: [Colors.green, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ));
  }

  @override
  void onClose() {
    super.onClose();
    idController.dispose();
    pwController.dispose();
  }
}
