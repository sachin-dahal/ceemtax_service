import 'package:ceemtax_service/data_source/form_details/models/form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormService {
  final CollectionReference _formCollection =
      FirebaseFirestore.instance.collection("form");

  Future submitForm(FormModel formModel, String uid) async {
    return await _formCollection.doc(uid).set(formModel.toJson());
    // return await _formCollection.doc(uid).set({
    //   'first_name': formModel.firstName,
    //   'middle_name': formModel.middleName,
    //   'last_name': formModel.lastName,
    //   'date_of_birth': formModel.dateOfBirth,
    //   'ssn': formModel.ssn,
    //   'number_of_dependents': formModel.numberOfDependents,
    //   'driver_license_id': formModel.driverLicenseId,
    //   'id_issue_date': formModel.idIssueDate,
    //   'id_expiry_date': formModel.idExpiryDate,
    //   'occupation': formModel.occupation,
    //   'address_1': formModel.address1,
    //   'address_2': formModel.address2,
    //   'zip_code': formModel.zipCode,
    //   'city': formModel.city,
    //   'state': formModel.state,
    //   'phone_number': formModel.phoneNumber,
    //   'email': formModel.email,
    //   'payment': formModel.payment,
    //   'comment': formModel.comment,
    // });
  }
}

// return await _formCollection.doc(uid).set({
//       'first_name': formModel.firstName,
//       'middle_name': formModel.middleName,
//       'last_name': formModel.lastName,
//       'date_of_birth': formModel.dateOfBirth,
//       'ssn': formModel.ssn,
//       'number_of_dependents': formModel.numberOfDependents,
//       'driver_license_id': formModel.driverLicenseId,
//       'id_issue_date': formModel.idIssueDate,
//       'id_expiry_date': formModel.idExpiryDate,
//       'occupation': formModel.occupation,
//       'address_1': formModel.address1,
//       'address_2': formModel.address2,
//       'zip_code': formModel.zipCode,
//       'city': formModel.city,
//       'state': formModel.state,
//       'phone_number': formModel.phoneNumber,
//       'email': formModel.email,
//       'payment': formModel.payment,
//       'comment': formModel.comment,
//     });
