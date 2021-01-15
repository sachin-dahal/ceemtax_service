import 'package:ceemtax_service/core/services/auth_service.dart';
import 'package:ceemtax_service/modules/features/wrapper/view/wrapper.dart';
import 'package:ceemtax_service/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(
    StreamProvider<User>.value(
      value: AuthService().userState,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kPrimaryColorLight2,
          primaryColor: kButtonColor1,
        ),
        title: "Ceemtax Service",
        home: CeemtaxService(),
      ),
    ),
  );
}

class CeemtaxService extends StatelessWidget {
  @override
  Widget build(Object context) {
    return SplashScreen(
      //navigateAfterSeconds: WrapperPage(),
      navigateAfterSeconds: WrapperPage(),
      seconds: 4,
      title: Text(
        'Ceem Tax Service',
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25.0,
          ),
        ),
      ),
      loadingTextPadding: EdgeInsets.symmetric(horizontal: 20.0),
      loadingText: Text(
        "Feel a peace-of-mind knowing you choose your tax preparer wisely",
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        ),
        textAlign: TextAlign.center,
      ),
      image: Image(image: AssetImage("images/logo_1.png")),
      backgroundColor: kBackgroundColor1,
      photoSize: 100.0,
      loaderColor: Colors.green[400],
    );
  }
}
