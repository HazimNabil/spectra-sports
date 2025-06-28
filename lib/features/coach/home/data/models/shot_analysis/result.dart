class Result {
  final String result;
  final String time;

  Result({
    required this.result,
    required this.time,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      result: json['result'],
      time: json['time'],
    );
  }
}
