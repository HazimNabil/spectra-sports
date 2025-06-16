import 'package:equatable/equatable.dart';

import 'box.dart';

class FaceModelResponse extends Equatable {
  final Box? box;
  final double? confidence;
  final String name;

  const FaceModelResponse({
    this.box,
    this.confidence,
    required this.name,
  });

  factory FaceModelResponse.fromJson(Map<String, dynamic> json) {
    return FaceModelResponse(
      box: json['box'] == null
          ? null
          : Box.fromJson(json['box'] as Map<String, dynamic>),
      confidence: (json['confidence'] as num?)?.toDouble(),
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'box': box?.toJson(),
      'confidence': confidence,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [box, confidence, name];
}
