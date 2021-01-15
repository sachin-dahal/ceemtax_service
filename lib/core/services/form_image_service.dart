import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_storage/get_storage.dart';

class FormImageService {
  GetStorage box = GetStorage();
  upload(File file) async {
    String uid = box.read("uid");
    Reference _ref =
        FirebaseStorage.instance.ref().child("card_images").child(uid + '.jpg');
    await _ref.putFile(file);
  }
}
