import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppointmentPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  Widget buildWebView() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Get.height / 10.0,
        horizontal: Get.height / 40.0,
      ),
      child: WebView(
        initialUrl: "https://blabla6906.setmore.com/timdunn",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
