import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginRegisterButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  LoginRegisterButton({
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: Get.width,
      buttonColor: kBackgroundColor2.withOpacity(0.5),
      child: RaisedButton(
        onPressed: onPressed,
        elevation: 15.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: kPrimaryColorLight2,
              letterSpacing: 1.1,
            ),
          ),
        ),
      ),
    );
  }
}
