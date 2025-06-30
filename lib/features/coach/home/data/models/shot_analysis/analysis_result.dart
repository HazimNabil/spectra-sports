class AnalysisResult {
  final String result;
  final String time;

  AnalysisResult({
    required this.result,
    required this.time,
  });

  factory AnalysisResult.fromJson(Map<String, dynamic> json) {
    return AnalysisResult(
      result: json['result'],
      time: json['time'],
    );
  }
}
