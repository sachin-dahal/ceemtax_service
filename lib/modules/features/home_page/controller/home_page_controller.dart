import 'package:ceemtax_service/core/modules/base_page_controller.dart';
import 'package:ceemtax_service/core/services/auth_service.dart';
import 'package:ceemtax_service/modules/features/login/view/login_page.dart';
import 'package:get/get.dart';

class HomePageController extends BasePageController {
  Future logOut() async {
    await AuthService().signOut();
    Get.offAll(LoginPage());
    return;
  }
}
