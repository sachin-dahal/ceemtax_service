import 'package:ceemtax_service/modules/data/models/animation/fade_animation.dart';
import 'package:ceemtax_service/modules/features/login/widgets/data_textfield_widget.dart';
import 'package:ceemtax_service/modules/features/login/widgets/login_register_button_widget.dart';
import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
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
            Container(
              height: Get.height / 2,
              width: Get.width,
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Column(
                children: [
                  FadeAnimation(
                    1,
                    DataTextfield(
                      hintText: "Email ID",
                      obscure: false,
                      iconData: FontAwesomeIcons.userAlt,
                      textInputType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  FadeAnimation(
                    1.2,
                    DataTextfield(
                      hintText: "Password",
                      obscure: true,
                      iconData: FontAwesomeIcons.key,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  FadeAnimation(
                    1.3,
                    LoginRegisterButton(
                      title: "SIGN IN",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Row(
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
