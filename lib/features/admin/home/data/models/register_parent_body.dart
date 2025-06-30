class RegisterParentBody {
  String? phoneNumber;
  String? name;
  String? email;
  List<String>? players;

  RegisterParentBody({
    this.phoneNumber,
    this.name,
    this.email,
    this.players,
  });

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'name': name,
      'email': email,
      'password': 'Abc@$phoneNumber',
      'players': players,
    };
  }
}
