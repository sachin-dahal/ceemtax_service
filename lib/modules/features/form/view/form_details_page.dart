import 'package:ceemtax_service/modules/features/form/utilities/mask_format_text.dart';
import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FormDetailsPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final String _ssnPattern =
      "^(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}\$";
  //  856-45-6789
  final String _zipCode = "^[0-9]{5}(?:-[0-9]{4})?\$";

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusScope.of(context);

    return Scaffold(
      body: FormBuilder(
        key: _fbKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                  focusNode: focusNode,
                ),
                SizedBox(height: Get.height / 30),
                _buildFormNormalTextField(
                  attribute: 'middle_name',
                  label: "Middle Name",
                  focusNode: focusNode,
                  validators: [],
                ),
                SizedBox(height: Get.height / 30),
                _buildRequiredStringTextField(
                  attribute: "last_name",
                  label: "Last Name",
                  focusNode: focusNode,
                ),
                SizedBox(height: Get.height / 25),
                _buildDatePicker(
                  attribute: "dob",
                  label: "Date of Birth",
                  focusNode: focusNode,
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
                SizedBox(height: Get.height / 25),
                _buildSSNTextField(focusNode: focusNode),
                SizedBox(height: Get.height / 25),
                _buildFormNormalTextField(
                    attribute: 'dependent_number',
                    label: "Number of Dependents",
                    keyboardType: TextInputType.number,
                    focusNode: focusNode,
                    validators: [
                      FormBuilderValidators.min(1, errorText: "More then 1"),
                      FormBuilderValidators.max(20, errorText: "Less than 20"),
                    ]),
                SizedBox(height: Get.height / 25),
                _buildDriverLicenseTextField(focusNode),
                SizedBox(height: Get.height / 25),
                _buildDatePicker(
                  attribute: "id_issue_date",
                  label: "ID Issue Date",
                  focusNode: focusNode,
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
                SizedBox(height: Get.height / 25),
                _buildDatePicker(
                  attribute: "id_expiry_date",
                  label: "ID Expiry Date",
                  focusNode: focusNode,
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
                SizedBox(height: Get.height / 25),
                _buildFormNormalTextField(
                    attribute: 'occupation',
                    label: "Occupation",
                    focusNode: focusNode,
                    validators: [
                      FormBuilderValidators.required(),
                    ]),
                // -------------------
                //  ADDRESS FIELD
                //--------------------
                SizedBox(height: Get.height / 25),
                Text(
                  "Address / Misc",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                SizedBox(height: Get.height / 25),
                _buildFormNormalTextField(
                    attribute: 'address1',
                    label: "Address 1",
                    focusNode: focusNode,
                    validators: [
                      FormBuilderValidators.required(),
                    ]),
                SizedBox(height: Get.height / 25),
                _buildFormNormalTextField(
                  attribute: 'address2',
                  label: "Address 2",
                  focusNode: focusNode,
                  validators: [],
                ),
                SizedBox(height: Get.height / 25),
                _buildFormNormalTextField(
                    attribute: 'zip_code',
                    label: "Zip Code",
                    keyboardType: TextInputType.number,
                    focusNode: focusNode,
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.pattern(
                        _zipCode,
                        errorText: "Enter a valid Zip Code",
                      ),
                    ]),
                SizedBox(height: Get.height / 25),
                _buildFormNormalTextField(
                  attribute: 'city',
                  label: "City",
                  focusNode: focusNode,
                  validators: [],
                ),

                //--------------------
                //   BUTTON
                //--------------------
                RaisedButton(
                  onPressed: () {
                    if (_fbKey.currentState.saveAndValidate()) {
                      final formInputs = _fbKey.currentState.value;
                      List<String> formList = formInputs.entries
                          .map((e) => e.value.toString().trim())
                          .toList();
                      print(formList);
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

  Widget _buildDriverLicenseTextField(FocusScopeNode focusNode) {
    return FormBuilderTextField(
      attribute: "driver_license",
      maxLength: 11,
      keyboardType: TextInputType.number,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(
          11,
          errorText: "This should be valid ID number",
        ),
      ],
      onEditingComplete: () => focusNode.nextFocus(),
      inputFormatters: [
        MaskedTextInputFormatter(
          mask: 'xxx-xxx-xxx',
          separator: '-',
        ),
      ],
      style: GoogleFonts.rubik(color: Colors.black87),
      decoration: InputDecoration(
        labelText: "Driver License / ID",
        counterText: "",
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

  Widget _buildSSNTextField({FocusScopeNode focusNode}) {
    return FormBuilderTextField(
      attribute: "ssn",
      maxLength: 11,
      keyboardType: TextInputType.number,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.pattern(_ssnPattern,
            errorText: "Enter a valid SSN")
      ],
      onEditingComplete: () => focusNode.nextFocus(),
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
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        fillColor: kPrimaryColor.withOpacity(0.5),
      ),
    );
  }

  Widget _buildFormNormalTextField({
    @required String attribute,
    @required String label,
    List<String Function(dynamic)> validators,
    TextInputType keyboardType,
    FocusScopeNode focusNode,
  }) {
    return FormBuilderTextField(
      attribute: attribute,
      keyboardType: keyboardType,
      style: GoogleFonts.rubik(color: Colors.black87),
      validators: validators,
      onEditingComplete: () => focusNode.nextFocus(),
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

  Widget _buildRequiredStringTextField({
    @required String attribute,
    @required String label,
    FocusScopeNode focusNode,
  }) {
    return FormBuilderTextField(
      attribute: attribute,
      validators: [
        FormBuilderValidators.required(),
      ],
      onEditingComplete: () => focusNode.nextFocus(),
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

  Widget _buildDatePicker({
    @required String attribute,
    @required String label,
    FocusScopeNode focusNode,
    List<String Function(dynamic)> validators,
  }) {
    return FormBuilderDateTimePicker(
      attribute: attribute,
      validators: validators,
      onEditingComplete: () => focusNode.nextFocus(),
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
