import 'package:ceemtax_service/data_source/form_details/models/form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormService {
  final CollectionReference _formCollection =
      FirebaseFirestore.instance.collection("form");

  Future submitForm(FormModel formModel, String uid) async {
    return await _formCollection.doc(uid).set(formModel.toJson());
  }
}
