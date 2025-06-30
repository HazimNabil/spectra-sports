class Attendee {
  String? playerId;
  String? name;
  bool? attendance;

  Attendee({this.playerId, this.name, this.attendance});

  factory Attendee.fromJson(Map<String, dynamic> json) {
    return Attendee(
      playerId: json['playerId'] as String?,
      name: json['name'] as String?,
      attendance: json['attendance'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'playerId': playerId,
      'name': name,
      'attendance': attendance,
    };
  }
}
