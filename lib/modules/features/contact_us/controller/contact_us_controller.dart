import 'package:ceemtax_service/core/modules/base_page_controller.dart';
import 'package:ceemtax_service/modules/features/contact_us/widgets/contact_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsController extends BasePageController {
  TextEditingController subjectController;
  TextEditingController bodyController;

  @override
  void onInit() {
    super.onInit();
    subjectController = TextEditingController();
    bodyController = TextEditingController();
  }

  int _date = DateTime.now().year;
  int get date => _date;

  _launchEmail(String subject, String body) async {
    final Uri _launchEmail = Uri(
        scheme: 'mailto',
        path: 'ceemtax@gmail.com',
        query: 'subject=$subject&body=$body');

    if (await canLaunch(_launchEmail.toString())) {
      await launch(_launchEmail.toString());
    } else {
      throw "Can't launch this mail";
    }
  }

  Widget buildContactButton() {
    return ContactButton(onPressed: () {
      if (subjectController.text.isEmpty && bodyController.text.isEmpty) {
        Get.snackbar("Sorry!", "Empty fields detected!!!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundGradient: LinearGradient(
              colors: [Colors.green, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ));
        return;
      } else {
        _launchEmail(
          subjectController.text,
          bodyController.text,
        );
      }
    });
  }

  void clearFields(){
    subjectController.clear();
    bodyController.clear();
  }

  @override
  void onClose() {
    super.onClose();
    subjectController.dispose();
    bodyController.dispose();
  }
}
