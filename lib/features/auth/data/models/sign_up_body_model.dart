class SignUpBodyModel {
  final String name;
  final String email;
  final String password;
  final String secretCode;

  SignUpBodyModel({
    required this.name,
    required this.email,
    required this.password,
    required this.secretCode,
  });

  factory SignUpBodyModel.fromJson(Map<String, dynamic> json) {
    return SignUpBodyModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      secretCode: json['secretCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'secretCode': secretCode,
    };
  }
}
