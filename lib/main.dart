import 'package:ceemtax_service/modules/features/home_page/view/home_page.dart';
import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColorLight2,
      ),
      title: "Ceemtax Service",
      home: CeemtaxService(),
    ),
  );
}

class CeemtaxService extends StatelessWidget {
  @override
  Widget build(Object context) {
    return SplashScreen(
      navigateAfterSeconds: HomePage(),
      seconds: 4,
      title: Text(
        'Ceem Tax Service',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image(image: AssetImage("images/logo_1.png")),
      backgroundColor: kBackgroundColor1,
      photoSize: 50.0,
      loaderColor: Colors.green[400],
    );
  }
}
