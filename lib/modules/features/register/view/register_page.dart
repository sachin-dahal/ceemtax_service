import 'package:ceemtax_service/modules/data/models/animation/fade_animation.dart';
import 'package:ceemtax_service/modules/features/login/view/login_page.dart';
import 'package:ceemtax_service/modules/features/login/widgets/data_textfield_widget.dart';
import 'package:ceemtax_service/modules/features/login/widgets/login_register_button_widget.dart';
import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
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
                    0.7,
                    DataTextfield(
                      hintText: "Email ID",
                      obscure: false,
                      iconData: FontAwesomeIcons.userAlt,
                      textInputType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  FadeAnimation(
                    0.8,
                    DataTextfield(
                      hintText: "Password",
                      obscure: true,
                      iconData: FontAwesomeIcons.key,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  FadeAnimation(
                    0.9,
                    DataTextfield(
                      hintText: "Re-type Password",
                      obscure: true,
                      iconData: FontAwesomeIcons.key,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  FadeAnimation(
                    1,
                    LoginRegisterButton(
                      title: "REGISTER",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Row(
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
