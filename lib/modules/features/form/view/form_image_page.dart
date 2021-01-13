import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FormImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height / 25),
              Text(
                "Additional Forms ",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              SizedBox(height: Get.height / 30),
              // SSN image
              Container(
                height: Get.height / 3,
                width: Get.width / 1.2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kButtonColor1,
                  ),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.add_a_photo,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  ),
                ),
                // Image(
                //     image: AssetImage("images/appointment_bg.png"),
                //     fit: BoxFit.cover,
                //   ),
              ),
              SizedBox(height: Get.height / 50),
              ButtonTheme(
                minWidth: Get.width / 2.4,
                height: Get.height / 20,
                buttonColor: Colors.blueGrey[300],
                child: RaisedButton(
                  onPressed: () {},
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "Upload SSN",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColorLight2,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 20),

              // Driver license
              Container(
                height: Get.height / 3,
                width: Get.width / 1.2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kButtonColor1,
                  ),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.add_a_photo,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  ),
                ),
                // Image(
                //     image: AssetImage("images/appointment_bg.png"),
                //     fit: BoxFit.cover,
                //   ),
              ),
              SizedBox(height: Get.height / 50),
              ButtonTheme(
                minWidth: Get.width / 2.4,
                height: Get.height / 20,
                buttonColor: Colors.blueGrey[300],
                child: RaisedButton(
                  onPressed: () {},
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "Upload Driver License",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColorLight2,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 20),

              // W2 Image
              Container(
                height: Get.height / 3,
                width: Get.width / 1.2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kButtonColor1,
                  ),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.add_a_photo,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  ),
                ),
                // Image(
                //     image: AssetImage("images/appointment_bg.png"),
                //     fit: BoxFit.cover,
                //   ),
              ),
              SizedBox(height: Get.height / 50),
              ButtonTheme(
                minWidth: Get.width / 2.4,
                height: Get.height / 20,
                buttonColor: Colors.blueGrey[300],
                child: RaisedButton(
                  onPressed: () {},
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "Upload W2",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColorLight2,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 25),
              ButtonTheme(
                minWidth: Get.width / 1.2,
                buttonColor: kBackgroundColor2.withOpacity(0.7),
                child: RaisedButton(
                  onPressed: () {},
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "SEND",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColorLight2,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 20),
            ],
          ),
        ),
      ),
    );
  }
}
