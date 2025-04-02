class SignUpBodyModel {
  String? name;
  String? email;
  String? password;
  String? secretCode;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'secretCode': secretCode,
    };
  }
}
