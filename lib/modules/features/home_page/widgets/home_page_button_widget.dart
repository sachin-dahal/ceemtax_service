import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  HomePageButton({
    this.title,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: Get.width / 1.3,
      height: 45.0,
      buttonColor: kButtonColor1.withOpacity(0.5),
      child: RaisedButton(
        elevation: 20.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: GoogleFonts.hammersmithOne(
            textStyle: TextStyle(
              color: kPrimaryColorLight1,
              fontSize: 20.0,
              letterSpacing: 1.1,
            ),
          ),
        ),
      ),
    );
  }
}
