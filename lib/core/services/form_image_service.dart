import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_storage/get_storage.dart';

class FormImageService {
  final box = GetStorage();

  upload(File file) async {
    String uid = box.read("uid");
    Reference _ref =
        FirebaseStorage.instance.ref().child(uid).child(file.path.substring(67));
    await _ref.putFile(file);
  }
}
