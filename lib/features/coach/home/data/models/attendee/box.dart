import 'package:equatable/equatable.dart';

class Box extends Equatable {
  final int? h;
  final int? w;
  final int? x;
  final int? y;

  const Box({this.h, this.w, this.x, this.y});

  factory Box.fromJson(Map<String, dynamic> json) => Box(
        h: json['h'] as int?,
        w: json['w'] as int?,
        x: json['x'] as int?,
        y: json['y'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'h': h,
        'w': w,
        'x': x,
        'y': y,
      };

  @override
  List<Object?> get props => [h, w, x, y];
}
