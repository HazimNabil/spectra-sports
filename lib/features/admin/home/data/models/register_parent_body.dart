class RegisterParentBody {
  String? phoneNumber;
  String? name;
  String? email;
  String? password;
  List<String>? players;

  RegisterParentBody({
    this.phoneNumber,
    this.name,
    this.email,
    this.password,
    this.players,
  });

  factory RegisterParentBody.fromJson(Map<String, dynamic> json) {
    return RegisterParentBody(
      phoneNumber: json['phoneNumber'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      players: json['players'] as List<String>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'name': name,
      'email': email,
      'password': password,
      'players': players,
    };
  }
}
