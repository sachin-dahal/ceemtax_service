import 'package:ceemtax_service/core/logger/logger.dart';
import 'package:ceemtax_service/modules/data/models/animation/fade_animation.dart';
import 'package:ceemtax_service/modules/features/home_page/view/home_page.dart';
import 'package:ceemtax_service/modules/features/login/controller/login_controller.dart';
import 'package:ceemtax_service/modules/features/login/widgets/data_textfield_widget.dart';
import 'package:ceemtax_service/modules/features/login/widgets/login_register_button_widget.dart';
import 'package:ceemtax_service/modules/features/register/view/register_page.dart';
import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = Get.put(LoginController());
  bool _showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorLight1,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: SingleChildScrollView(
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
                    Text(
                      "Ceem Tax Service",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
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
            0.5,
            DataTextfield(
              textEditingController: _loginController.idController,
              hintText: "Email ID",
              obscure: false,
              iconData: FontAwesomeIcons.userAlt,
              textInputType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(height: 15.0),
          FadeAnimation(
            0.5,
            DataTextfield(
              textEditingController: _loginController.pwController,
              hintText: "Password",
              obscure: true,
              iconData: FontAwesomeIcons.key,
            ),
          ),
          SizedBox(height: 40.0),
          FadeAnimation(
            0.6,
            LoginRegisterButton(
              title: "SIGN IN",
              onPressed: () async {
                setState(() {
                  _showSpinner = true;
                });
                Log.debug("log 1", "${_loginController.isLogReg.toString()}");
                bool field = _loginController.fieldValidation(
                    _loginController.idController.text,
                    _loginController.pwController.text);

                if (field == true) {
                  var user = await _loginController.signInUser();
                  if (user == null) {
                    Get.defaultDialog(
                      title: "Account not Found!",
                      titleStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      )),
                      middleText: "Please enter valid details",
                      middleTextStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      )),
                      backgroundColor: Colors.red[100],
                    );
                    return;
                  } else if (user != null) {
                    Get.offAll(HomePage());
                    _loginController.idController.clear();
                    _loginController.pwController.clear();
                    Log.debug("LOGIN USER: ", user.toString());
                  }
                }
                setState(() {
                  _showSpinner = false;
                });
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
          "Not a user? ",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              letterSpacing: 1.1,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(RegisterPage());

            _loginController.idController.clear();
            _loginController.pwController.clear();
          },
          child: Text(
            "Sign Up",
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
