import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUsPage extends StatelessWidget {
  int date = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            SizedBox(height: Get.height / 35),
            Text(
              "Contact Us",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.1,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'images/contactus.png',
                height: 150,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Do you have any queries? \n Feel free to contact us",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  TextField(
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                      hintText: "Subject",
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
                  ),
                  SizedBox(height: 15),
                  TextField(
                    maxLines: 5,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                      hintText: "Message",
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            ButtonTheme(
              minWidth: Get.width/1.5,
              buttonColor: kBackgroundColor2.withOpacity(0.5),
              child: RaisedButton(
                onPressed: () {},
                elevation: 15.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  "SEND",
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
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Copyright (C) ${date.toString()}. Ceem Tax Service\nAll Rights Reserved.",
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(color: Colors.grey[500]),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
