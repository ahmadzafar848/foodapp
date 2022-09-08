import 'dart:convert';

class SignInUserModel {
  String? _email;
  String? _password;
  SignInUserModel({
    String? email,
    String? password,
  }) {
    _email = email;
    _password = password;
  }

  SignInUserModel.fromJson(dynamic json) {
    _email = json['Email'];
    _password = json['Password'];
  }

  SignInUserModel copyWith({
    String? email,
    String? password,
  }) =>
      SignInUserModel(
        email: email ?? _email,
        password: password ?? _password,
      );
  String? get email => _email;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Email'] = _email;
    map['Password'] = _password;
    return map;
  }
}

SignInUserModel signInUserModelFromJson(String str) =>
    SignInUserModel.fromJson(json.decode(str));
String signInUserModelToJson(SignInUserModel data) =>
    json.encode(data.toJson());
