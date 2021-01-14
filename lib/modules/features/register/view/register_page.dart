import 'package:ceemtax_service/core/logger/logger.dart';
import 'package:ceemtax_service/modules/data/models/animation/fade_animation.dart';
import 'package:ceemtax_service/modules/features/home_page/view/home_page.dart';
import 'package:ceemtax_service/modules/features/login/view/login_page.dart';
import 'package:ceemtax_service/modules/features/login/widgets/data_textfield_widget.dart';
import 'package:ceemtax_service/modules/features/login/widgets/login_register_button_widget.dart';
import 'package:ceemtax_service/modules/features/register/controller/register_controller.dart';
import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController _registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorLight1,
      //resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height / 2,
              width: Get.width,
              color: kBackgroundColor2.withOpacity(0.5),
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 30.0,
              ),
              child: Column(
                children: [
                  Image(
                    image: AssetImage("images/logo_1.png"),
                    height: Get.height / 5,
                  ),
                  Text("Ceem Tax Service",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      )),
                  SizedBox(height: 40.0),
                  Text(
                    "We focus our energy everyday on understanding the specific and unique needs of our clients.",
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            _buildFormFragment(),
          ],
        ),
      ),
    );
  }

  Widget _buildFormFragment() {
    return Container(
      height: Get.height / 2,
      width: Get.width,
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Column(
        children: [
          FadeAnimation(
            0.4,
            DataTextfield(
              textEditingController: _registerController.idTextController,
              hintText: "Email ID",
              obscure: false,
              iconData: FontAwesomeIcons.userAlt,
              textInputType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(height: 10.0),
          FadeAnimation(
            0.5,
            DataTextfield(
              textEditingController: _registerController.pw1TextController,
              hintText: "Password",
              obscure: true,
              iconData: FontAwesomeIcons.key,
            ),
          ),
          SizedBox(height: 10.0),
          FadeAnimation(
            0.6,
            DataTextfield(
              textEditingController: _registerController.pw2TextController,
              hintText: "Re-type Password",
              obscure: true,
              iconData: FontAwesomeIcons.key,
            ),
          ),
          SizedBox(height: 30.0),
          FadeAnimation(
            0.7,
            LoginRegisterButton(
              title: "REGISTER",
              onPressed: () {
                bool pw = _registerController.reTypePasswordValidation(
                  _registerController.pw1TextController.text,
                  _registerController.pw2TextController.text,
                );

                bool field = _registerController.fieldValidation(
                  _registerController.idTextController.text,
                  _registerController.pw1TextController.text,
                );

                if (pw == true && field == true) {
                  var user = _registerController.registerUser();
                  if (user == null) {
                    Get.snackbar("Error", "Error while regestering",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundGradient: LinearGradient(
                          colors: [Colors.green, Colors.blue],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ));
                    return;
                  } else {
                    Get.to(HomePage());
                    _registerController.idTextController.clear();
                    _registerController.pw1TextController.clear();
                    _registerController.pw2TextController.clear();
                    Log.debug("REGISTER USER: ", user.toString());
                  }
                }
              },
            ),
          ),
          SizedBox(height: 20.0),
          Center(child: _buildBelowNav()),
        ],
      ),
    );
  }

  Widget _buildBelowNav() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already a user? ",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              letterSpacing: 1.1,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.offAll(LoginPage()),
          child: Text(
            "Sign In",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: kButtonColor2,
                letterSpacing: 1.1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
