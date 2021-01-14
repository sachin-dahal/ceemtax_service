class FormModel {
  String firstName;
  String middleName;
  String lastName;
  String dateOfBirth;
  String ssn;
  String numberOfDependents;
  String driverLicenseId;
  String idIssueDate;
  String idExpiryDate;
  String occupation;
  String address1;
  String address2;
  String zipCode;
  String city;
  String state;
  String phoneNumber;
  String email;
  String payment;
  String comment;

  FormModel({
    this.firstName,
    this.middleName,
    this.lastName,
    this.dateOfBirth,
    this.ssn,
    this.numberOfDependents,
    this.driverLicenseId,
    this.idIssueDate,
    this.idExpiryDate,
    this.occupation,
    this.address1,
    this.address2,
    this.zipCode,
    this.city,
    this.state,
    this.phoneNumber,
    this.email,
    this.payment,
    this.comment,
  });

  FormModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    dateOfBirth = json['date_of_birth'];
    ssn = json['ssn'];
    numberOfDependents = json['number_of_dependents'];
    driverLicenseId = json['driver_license_id'];
    idIssueDate = json['id_issue_date'];
    idExpiryDate = json['id_expiry_date'];
    occupation = json['occupation'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    zipCode = json['zip_code'];
    city = json['city'];
    state = json['state'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    payment = json['payment'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['date_of_birth'] = this.dateOfBirth;
    data['ssn'] = this.ssn;
    data['number_of_dependents'] = this.numberOfDependents;
    data['driver_license_id'] = this.driverLicenseId;
    data['id_issue_date'] = this.idIssueDate;
    data['id_expiry_date'] = this.idExpiryDate;
    data['occupation'] = this.occupation;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['zip_code'] = this.zipCode;
    data['city'] = this.city;
    data['state'] = this.state;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['payment'] = this.payment;
    data['comment'] = this.comment;
    return data;
  }
}
