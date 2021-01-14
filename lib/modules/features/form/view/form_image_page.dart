import 'dart:io';

import 'package:ceemtax_service/core/logger/logger.dart';
import 'package:ceemtax_service/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FormImagePage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: _fbKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Get.height / 25),
                Text(
                  "Additional Forms ",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                SizedBox(height: Get.height / 30),
                // Driver License image
                FormBuilderImagePicker(
                  attribute: "ssn_image",
                  maxImages: 1,
                  imageHeight: Get.height / 3,
                  imageWidth: Get.width,
                  validators: [
                    FormBuilderValidators.required(
                      errorText: "A picture of SSN is required",
                    ),
                  ],
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Upload SSN",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                Divider(thickness: 1),
                // SSN image
                FormBuilderImagePicker(
                  attribute: "driver_license_image",
                  maxImages: 1,
                  imageHeight: Get.height / 3,
                  imageWidth: Get.width,
                  validators: [
                    FormBuilderValidators.required(
                      errorText: "A picture of Driver License is required",
                    ),
                  ],
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Upload Driver License",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                Divider(thickness: 1),

                // W2 image
                FormBuilderImagePicker(
                  attribute: "w2_image",
                  imageHeight: Get.height / 3,
                  imageWidth: Get.width,
                  validators: [
                    FormBuilderValidators.required(
                      errorText: "A picture of W2 is required",
                    ),
                  ],
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Upload W2",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                Divider(thickness: 1),
                //--------------------
                //   BUTTON
                //--------------------
                RaisedButton(
                  onPressed: () {
                    List<File> formList = [];
                    if (_fbKey.currentState.saveAndValidate()) {
                      final formInputs = _fbKey.currentState.value;
                      final ssnImage = formInputs["ssn_image"][0];
                      final driverLicenseImage =
                          formInputs["driver_license_image"][0];
                      List w2Images = formInputs["w2_image"];
                      Log.debug("SSN", "$ssnImage");
                      Log.debug("Driver", "$driverLicenseImage");
                      Log.debug("W2", "$w2Images");
                      formList..add(ssnImage)..add(driverLicenseImage);
                      w2Images.forEach((e) {
                        formList.add(e);
                      });
                      Log.debug("Images List", "$formList");

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
                SizedBox(height: Get.height / 25),
                ButtonTheme(
                  minWidth: Get.width / 1.2,
                  buttonColor: kBackgroundColor2.withOpacity(0.7),
                  child: RaisedButton(
                    onPressed: () {},
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      "SEND",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColorLight2,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height / 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
