import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataTextfield extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final bool obscure;
  final TextInputType textInputType;
  final TextEditingController textEditingController;

  DataTextfield({
    this.hintText,
    this.iconData,
    this.obscure,
    this.textInputType,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      obscureText: obscure,
      keyboardType: textInputType,
      cursorColor: kButtonColor1,
      style: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 16.0,
        ),
      ),
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        prefixIcon: Icon(
          iconData,
          size: 15.0,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.rubik(
          textStyle: TextStyle(
            fontSize: 16.0,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: kButtonColor1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kButtonColor1, width: 2.0),
        ),
      ),
    );
  }
}
