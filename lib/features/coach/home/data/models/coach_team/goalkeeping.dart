import 'package:equatable/equatable.dart';

class Goalkeeping extends Equatable {
  final int? diving;
  final int? handling;
  final int? kicking;
  final int? positioning;
  final int? reflexes;
  final int? speed;

  const Goalkeeping({
    this.diving,
    this.handling,
    this.kicking,
    this.positioning,
    this.reflexes,
    this.speed,
  });

  factory Goalkeeping.fromJson(Map<String, dynamic> json) => Goalkeeping(
        diving: json['diving'] as int?,
        handling: json['handling'] as int?,
        kicking: json['kicking'] as int?,
        positioning: json['positioning'] as int?,
        reflexes: json['reflexes'] as int?,
        speed: json['speed'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'diving': diving,
        'handling': handling,
        'kicking': kicking,
        'positioning': positioning,
        'reflexes': reflexes,
        'speed': speed,
      };

  @override
  List<Object?> get props {
    return [
      diving,
      handling,
      kicking,
      positioning,
      reflexes,
      speed,
    ];
  }
}
