import 'package:ceemtax_service/modules/data/models/animation/fade_animation.dart';
import 'package:ceemtax_service/modules/features/about_us/view/about_us_page.dart';
import 'package:ceemtax_service/modules/features/appointment/view/appointment_page.dart';
import 'package:ceemtax_service/modules/features/contact_us/view/contact_us_page.dart';
import 'package:ceemtax_service/modules/features/home_page/controller/home_page_controller.dart';
import 'package:ceemtax_service/modules/features/home_page/widgets/home_page_button_widget.dart';
import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final HomePageController _homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ceem Tax Finance",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 20.0,
              color: kPrimaryColorLight1,
              letterSpacing: 1.3,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _homePageController.logOut(),
          ),
          SizedBox(width: 5.0),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                height: Get.height / 4.5,
                width: Get.width / 1.2,
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
                onPressed: () => Get.to(ContactUsPage()),
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
