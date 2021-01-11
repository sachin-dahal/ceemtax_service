import 'package:ceemtax_service/modules/data/models/animation/fade_animation.dart';
import 'package:ceemtax_service/modules/features/contact_us/controller/contact_us_controller.dart';
import 'package:ceemtax_service/modules/features/contact_us/widgets/contact_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUsPage extends StatelessWidget {
  final ContactUsController _contactUsController =
      Get.put(ContactUsController());

  @override
  Widget build(BuildContext context) {
    _contactUsController.clearFields();

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
            FadeAnimation(
              0.6,
              Center(
                child: Image.asset(
                  'images/contactus.png',
                  height: 150,
                ),
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
                  FadeAnimation(
                    0.8,
                    ContactTextField(
                      textEditingController:
                          _contactUsController.subjectController,
                      title: "Subject",
                    ),
                  ),
                  SizedBox(height: 15),
                  FadeAnimation(
                    1,
                    ContactTextField(
                      textEditingController:
                          _contactUsController.bodyController,
                      title: "Message",
                      lines: 6,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            FadeAnimation(
              1.1,
              GetBuilder<ContactUsController>(
                builder: (_contactUsController) {
                  return _contactUsController.buildContactButton();
                },
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Copyright (C) ${_contactUsController.date.toString()}. Ceem Tax Service\nAll Rights Reserved.",
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(color: Colors.grey[500]),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
