import 'dart:convert';

class UserModel {
  String? firstName;
  String? lastName;
  String? middleName;
  String? phoneNumber;
  String? dob;
  String? emailAddress;
  String? password;
  String? gender;

  UserModel({
    this.firstName,
    this.lastName,
    this.middleName,
    this.phoneNumber,
    this.dob,
    this.emailAddress,
    this.password,
    this.gender,
  });

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "middleName": middleName,
        "phoneNumber": phoneNumber,
        "dob": dob,
        "emailAddress": emailAddress,
        "password": password,
        "gender": gender,
      };

  factory UserModel.fromJsonString(String strJson) {
    Map<String, dynamic> map = json.decode(strJson);
    return UserModel(
      firstName: map['firstName,'],
      lastName: map['lastName,'],
      middleName: map['middleName,'],
      phoneNumber: map['phoneNumber,'],
      dob: map['dob,'],
      emailAddress: map['emailAddress,'],
      password: map['password,'],
      gender: map['gender,'],
    );
  }
}
