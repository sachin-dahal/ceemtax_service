import 'package:ceemtax_service/modules/features/form/utilities/mask_format_text.dart';
import 'package:ceemtax_service/modules/features/form/utilities/us_state_list.dart';
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
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
                SizedBox(height: Get.height / 25),
                _buildUSStatesDropdown(),
                SizedBox(height: Get.height / 25),
                _buildPhoneTextField(focusNode),
                SizedBox(height: Get.height / 25),
                _buildFormNormalTextField(
                    attribute: "email",
                    label: "Email Address",
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                SizedBox(height: Get.height / 25),
                _buildPaymentDropdown(),
                SizedBox(height: Get.height / 25),
                _buildCommentTextField(focusNode),
                SizedBox(height: Get.height / 20),
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
                        ),
                      );
                    }
                  },
                  child: Text("Press"),
                ),
                SizedBox(height: Get.height / 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCommentTextField(FocusScopeNode focusNode) {
    return FormBuilderTextField(
                attribute: "comment",
                maxLines: 1,
                style: GoogleFonts.rubik(color: Colors.black87),
                onEditingComplete: () => focusNode.unfocus(),
                decoration: InputDecoration(
                  labelText: "Comment",
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
              );
  }

  FormBuilderDropdown<String> _buildPaymentDropdown() {
    return FormBuilderDropdown(
      attribute: "payment",
      items: ["Withhold Fees From Refund", "Pay at Time of Filing"]
          .map((paymentOption) => DropdownMenuItem(
                value: paymentOption,
                child: Text("$paymentOption"),
              ))
          .toList(),
      style: GoogleFonts.rubik(color: Colors.black87),
      decoration: InputDecoration(
        labelText: "Payment",
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

  Widget _buildPhoneTextField(FocusScopeNode focusNode) {
    return FormBuilderPhoneField(
      attribute: "phone_number",
      maxLines: 1,
      validators: [
        FormBuilderValidators.required(),
      ],
      onEditingComplete: () => focusNode.nextFocus(),
      style: GoogleFonts.rubik(color: Colors.black87),
      decoration: InputDecoration(
        labelText: "Phone/Cellular Number",
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

  FormBuilderDropdown<String> _buildUSStatesDropdown() {
    return FormBuilderDropdown(
      attribute: "state",
      items: usState
          .map((state) => DropdownMenuItem(
                value: state,
                child: Text("$state"),
              ))
          .toList(),
      style: GoogleFonts.rubik(color: Colors.black87),
      decoration: InputDecoration(
        labelText: "State",
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
      maxLines: 1,
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
      maxLines: 1,
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
