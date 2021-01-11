import 'package:get/get.dart';

abstract class BasePageController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading([bool loading = true]) {
    _isLoading = loading;
    update();
  }
}