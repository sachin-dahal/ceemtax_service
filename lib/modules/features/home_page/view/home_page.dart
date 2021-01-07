import 'package:ceemtax_service/modules/features/home_page/widgets/home_page_button_widget.dart';
import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: Get.height / 40),
            Center(
              child: Container(
                height: Get.height / 3,
                child: Image(
                  image: AssetImage("images/banner.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            HomePageButton(
              title: "APPOINTMENT",
              onPressed: () {},
            ),
            SizedBox(height: Get.height / 20),
            HomePageButton(
              title: "FILL FORM",
              onPressed: () {},
            ),
            SizedBox(height: Get.height / 20),
            HomePageButton(
              title: "CONTACT US",
              onPressed: () {},
            ),
            SizedBox(height: Get.height / 20),
            HomePageButton(
              title: "OUR STAFF",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
