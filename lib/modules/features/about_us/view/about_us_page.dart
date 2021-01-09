import 'package:ceemtax_service/modules/data/models/animation/fade_animation.dart';
import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height / 20),
            FadeAnimation(
              0.5,
              Center(
                child: Container(
                  height: Get.height / 1.6,
                  width: Get.width / 1.1,
                  decoration: BoxDecoration(
                    color: kPrimaryColorLight2,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: kPrimaryColorLight2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(1, 1),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage("images/logo_1.png"),
                            height: Get.height / 4.0,
                          ),
                          Expanded(
                            child: Text(
                              "A part of Ceem Financial Services. At Ceem Tax Service, our primary focus is to provide an outstanding service to our clients making each and every return count, helping clients with education and customer care.",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.end,
                              style: GoogleFonts.rubik(
                                  fontSize: 14.0, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Expanded(
                        child: Text(
                          "We focus our energy everyday on communicating, understanding and meeting the very specific and unique needs of our clients. \n\nOur registered tax return preparers are professional from the start. With Ceem Tax Service, you won’t have to worry whether your taxes are being properly handled. You can have peace-of-mind knowing you chose your tax preparer wisely. ",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.rubik(
                              fontSize: 14.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //
            SizedBox(height: 30.0),
            Container(
              height: Get.height / 3,
              width: Get.width / 1.1,
              decoration: BoxDecoration(
                color: kPrimaryColorLight2,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: kPrimaryColorLight2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(1, 1),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Center(child: Text("Godwin")),
            ),
            SizedBox(height: 30.0),
            Container(
              height: Get.height / 3,
              width: Get.width / 1.1,
              decoration: BoxDecoration(
                color: kPrimaryColorLight2,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: kPrimaryColorLight2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(1, 1),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Center(child: Text("Mellisa")),
            ),
            SizedBox(height: 30.0),
            Container(
              height: Get.height / 3.5,
              width: Get.width / 1.1,
              decoration: BoxDecoration(
                color: kPrimaryColorLight2,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: kPrimaryColorLight2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(1, 1),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Center(child: Text("Marcus")),
            ),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
