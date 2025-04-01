class LoginBodyModel {
  String? email;
  String? password;
  String? role;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'role': role,
    };
  }
}
