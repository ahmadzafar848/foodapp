import 'dart:convert';

class SignUpUserModel {
  String? email;
  String? password;
  String? displayName;
  String? loginBy;
  SignUpUserModel({
    this.email,
    this.password,
    this.displayName,
    this.loginBy,
  });

  factory SignUpUserModel.fromJson(String str) =>
      SignUpUserModel.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory SignUpUserModel.fromMap(Map<String, dynamic> json) => SignUpUserModel(
        email: json["Email"],
        password: json["Password"],
        displayName: json["DisplayName"],
        loginBy: json["LoginBy"],
      );

  Map<String, dynamic> toMap() => {
        "Email": email,
        "Password": password,
        "DisplayName": displayName,
        "LoginBy": loginBy,
      };
}
