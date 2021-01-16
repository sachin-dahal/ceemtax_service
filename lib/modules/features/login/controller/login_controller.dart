import 'package:ceemtax_service/core/modules/base_page_controller.dart';
import 'package:ceemtax_service/core/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends BasePageController {
  AuthService _authService = AuthService();
  TextEditingController idController;
  TextEditingController pwController;
  RxBool isLogReg = false.obs;

  @override
  void onInit() {
    super.onInit();
    idController = TextEditingController();
    pwController = TextEditingController();
  }

  setLogRegLoading([bool loading = true]) {
    isLogReg = loading.obs;
    update();
  }

  bool fieldValidation(String email, String password) {
    if (email.isEmpty && password.isEmpty) {
      _errorSnackbar(errorMsg: "Empty fields detected!");
      return false;
    } else {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      bool pwValid = password.length >= 6;

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

  Future signInUser() async {
    try {
      var user = await _authService.signInWithEmail(
        idController.text,
        pwController.text,
      );
      return user;
    } catch (e) {
      throw "Exception in Login Controller: No user found";
    }
  }

  _errorSnackbar({String errorMsg}) {
    return Get.snackbar(
      "Sorry!",
      errorMsg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red[200],
    );
  }

  @override
  void onClose() {
    super.onClose();
    idController.dispose();
    pwController.dispose();
  }
}
