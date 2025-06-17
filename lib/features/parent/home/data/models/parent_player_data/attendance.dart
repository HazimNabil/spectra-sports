class Attendance {
  final DateTime date;
  final bool present;
  final String id;

  Attendance({
    required this.date,
    required this.present,
    required this.id,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      date: DateTime.parse(json['date'] as String),
      present: json['present'] as bool,
      id: json['_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'present': present,
      '_id': id,
    };
  }
}
