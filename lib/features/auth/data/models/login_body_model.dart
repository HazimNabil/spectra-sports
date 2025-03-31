class LoginBodyModel {
  final String email;
  final String password;
  final String role;

  LoginBodyModel({
    required this.email,
    required this.password,
    required this.role,
  });

  factory LoginBodyModel.fromJson(Map<String, dynamic> json) {
    return LoginBodyModel(
      email: json['email'],
      password: json['password'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'role': role,
    };
  }
}
