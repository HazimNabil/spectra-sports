class RegisterCoachBody {
  String? name;
  String? email;
  String? teamId;
  String? phoneNumber;
  String? password;

  RegisterCoachBody({
    this.email,
    this.name,
    this.teamId,
    this.phoneNumber,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      '_id': phoneNumber,
      'name': name,
      'email': email,
      'teamId': teamId,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }
}
