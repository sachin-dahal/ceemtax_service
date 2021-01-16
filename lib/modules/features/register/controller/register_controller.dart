import 'package:ceemtax_service/core/services/auth_service.dart';
import 'package:ceemtax_service/modules/features/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends LoginController {
  AuthService _authService = AuthService();
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

  bool emailValidation(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid == false) {
      Get.snackbar(
        "INVALID EMAIL",
        "Please enter a valid email to register",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[200],
      );
      return false;
    }
    return true;
  }

  bool reTypePasswordValidation(String password1, String password2) {
    if (password1 != password2) {
      Get.snackbar(
        "Sorry!",
        "Password didn't matched",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[200],
      );
      return false;
    }
    return true;
  }

  Future registerUser() async {
    var user = await _authService.registerWithEmail(
        idTextController.text, pw1TextController.text);
    return user;
  }
  
  @override
  void onClose() {
    super.onClose();
    idTextController.dispose();
    pw1TextController.dispose();
    pw2TextController.dispose();
  }
}
