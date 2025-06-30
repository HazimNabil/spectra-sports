class RegisterCoachBody {
  String? name;
  String? email;
  String? teamId;
  String? phoneNumber;

  RegisterCoachBody({
    this.email,
    this.name,
    this.teamId,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      '_id': phoneNumber,
      'name': name,
      'email': email,
      'teamId': teamId,
      'phoneNumber': phoneNumber,
      'password': 'Abc@$phoneNumber',
    };
  }
}
