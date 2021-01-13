import 'dart:developer';

import 'package:ceemtax_service/modules/features/form/utilities/mask_format_text.dart';
import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FormDetailsPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final _ssn_pattern = "^(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}\$";
  //  856-45-6789

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: _fbKey,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: Get.height / 25),
                Text(
                  "Taxpayer Form",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                SizedBox(height: Get.height / 30),
                _buildRequiredStringTextField(
                  attribute: 'first_name',
                  label: "First Name",
                ),
                SizedBox(height: Get.height / 30),
                _buildFormNormalTextField(
                  attribute: 'middle_name',
                  label: "Middle Name",
                ),
                SizedBox(height: Get.height / 30),
                _buildRequiredStringTextField(
                  attribute: "last_name",
                  label: "Last Name",
                ),
                SizedBox(height: Get.height / 25),
                _buildDatePicker(
                  attribute: "dob",
                  label: "Date of Birth",
                ),
                SizedBox(height: Get.height / 25),
                FormBuilderTextField(
                  attribute: "ssn",
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  validators: [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.pattern(_ssn_pattern,
                        errorText: "Enter a valid SSN")
                  ],
                  inputFormatters: [
                    MaskedTextInputFormatter(
                      mask: 'xxx-xx-xxxx',
                      separator: '-',
                    ),
                  ],
                  style: GoogleFonts.rubik(color: Colors.black87),
                  decoration: InputDecoration(
                    labelText: "Social Security Number (SSN)",
                    counterText: "",
                    labelStyle: GoogleFonts.rubik(),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    fillColor: kPrimaryColor.withOpacity(0.5),
                  ),
                ),
                //
                //   BUTTON
                //
                RaisedButton(
                  onPressed: () {
                    if (_fbKey.currentState.saveAndValidate()) {
                      final formInputs = _fbKey.currentState.value;
                      List<String> formList = formInputs.entries
                          .map((e) => e.value.toString().trim())
                          .toList();
                      print(formList);
                      // var date = DateTime.parse(formList[3]);
                      // var formattedDate =
                      //     "${date.day}-${date.month}-${date.year}";
                      // print(formattedDate);
                      // formList[3] = formattedDate;
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text("Form inputs"),
                                content: Text("$formList"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              ));
                    }
                  },
                  child: Text("Press"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormNormalTextField(
      {@required String attribute, @required String label}) {
    return FormBuilderTextField(
      attribute: attribute,
      style: GoogleFonts.rubik(color: Colors.black87),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.rubik(),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        fillColor: kPrimaryColor.withOpacity(0.5),
      ),
    );
  }

  Widget _buildRequiredStringTextField(
      {@required String attribute, @required String label}) {
    return FormBuilderTextField(
      attribute: attribute,
      validators: [
        FormBuilderValidators.required(),
      ],
      style: GoogleFonts.rubik(color: Colors.black87),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.rubik(),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        fillColor: kPrimaryColor.withOpacity(0.5),
      ),
    );
  }

  Widget _buildDatePicker(
      {@required String attribute, @required String label}) {
    return FormBuilderDateTimePicker(
      attribute: attribute,
      validators: [
        FormBuilderValidators.required(),
      ],
      inputType: InputType.date,
      valueTransformer: (val) {
        var formattedDate =
            val != null ? "${val.day}-${val.month}-${val.year}" : null;
        return formattedDate;
      },
      style: GoogleFonts.rubik(color: Colors.black87),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.rubik(),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        fillColor: kPrimaryColor.withOpacity(0.5),
      ),
    );
  }
}

//               SizedBox(height: Get.height / 25),
//               TextField(
//                 style: GoogleFonts.rubik(color: Colors.black87),
//                 onTap: () async {
//                   await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(1940),
//                           lastDate: DateTime(2100))
//                       .then((pickedDate) {
//                     var date = "${pickedDate.day.toString()}-" +
//                         "${pickedDate.month.toString()}-" +
//                         "${pickedDate.year.toString()}";
//                     _dateController.text = date;
//                   });
//                 },
//                 readOnly: true,
//                 controller: _dateController,
//                 decoration: InputDecoration(
//                   labelText: "Date of Birth",
//                   labelStyle: GoogleFonts.rubik(),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   filled: true,
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
//                   fillColor: kPrimaryColor.withOpacity(0.5),
//                 ),
//               ),
