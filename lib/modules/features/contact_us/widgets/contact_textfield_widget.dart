import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactTextField extends StatelessWidget {
  final String title;
  final int lines;
  final TextEditingController textEditingController;

  ContactTextField({
    this.title,
    this.lines,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 16.0,
        ),
      ),
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        hintText: title,
        hintStyle: GoogleFonts.rubik(
          textStyle: TextStyle(
            fontSize: 16.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kButtonColor1,
          ),
        ),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 15.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kButtonColor1,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
