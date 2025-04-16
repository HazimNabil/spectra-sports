class CoachId {
  final String id;
  final String name;

  CoachId({required this.id, required this.name});

  factory CoachId.fromJson(Map<String, dynamic> json) {
    return CoachId(
      id: json['_id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}
