import 'package:ceemtax_service/modules/data/models/animation/fade_animation.dart';
import 'package:ceemtax_service/modules/features/about_us/view/about_us_page.dart';
import 'package:ceemtax_service/modules/features/appointment/view/appointment_page.dart';
import 'package:ceemtax_service/modules/features/home_page/widgets/home_page_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            FadeAnimation(
              1.0,
              HomePageButton(
                title: "APPOINTMENT",
                onPressed: () => Get.to(AppointmentPage()),
              ),
            ),
            SizedBox(height: Get.height / 20),
            FadeAnimation(
              1.2,
              HomePageButton(
                title: "FILL FORM",
                onPressed: () {},
              ),
            ),
            SizedBox(height: Get.height / 20),
            FadeAnimation(
              1.4,
              HomePageButton(
                title: "CONTACT US",
                onPressed: () {},
              ),
            ),
            SizedBox(height: Get.height / 20),
            FadeAnimation(
              1.6,
              HomePageButton(
                title: "ABOUT US",
                onPressed: () => Get.to(AboutUsPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
