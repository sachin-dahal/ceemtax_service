import 'package:ceemtax_service/core/logger/logger.dart';
import 'package:ceemtax_service/modules/features/home_page/view/home_page.dart';
import 'package:ceemtax_service/modules/features/login/view/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//--------------------------------------
//  Redirect to LoginPage() or HomePage()
//--------------------------------------
class WrapperPage extends StatelessWidget {
  //final WrapperController _wrapperController = Get.put(WrapperController());
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      Log.debug("WRAPPER", "Head to Login Page");
      return LoginPage();
    } else {
      Log.debug("WRAPPER", "Head to Home Page");
      return HomePage();
    }
  }
}
