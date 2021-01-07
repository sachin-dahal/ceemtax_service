import 'package:ceemtax_service/modules/features/appointment/controller/appointment_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentPage extends StatelessWidget {
  final AppointmentPageController _appointmentPageController =
      Get.put(AppointmentPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AppointmentPageController>(
          builder: (_appointmentPageController) {
        return _appointmentPageController.buildWebView();
      }),
    );
  }
}
