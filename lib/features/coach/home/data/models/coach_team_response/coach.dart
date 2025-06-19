class Coach {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;

  Coach({this.id, this.name, this.email, this.phoneNumber});

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
      };
}
