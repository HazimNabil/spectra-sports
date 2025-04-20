import 'package:spectra_sports/core/models/player.dart';

class PredictPositionInput {
  final int pace;
  final int shooting;
  final int passing;
  final int attackingCrossing;
  final int dribbling;
  final int defending;
  final int physic;
  final double heightCm;

  PredictPositionInput({
    required this.pace,
    required this.shooting,
    required this.passing,
    required this.attackingCrossing,
    required this.dribbling,
    required this.defending,
    required this.physic,
    required this.heightCm,
  });

  factory PredictPositionInput.fromPlayer(Player player) {
    return PredictPositionInput(
      pace: player.pace,
      shooting: player.shooting,
      passing: player.passing,
      attackingCrossing: player.attackingCrossing,
      dribbling: player.dribbling,
      defending: player.defending,
      physic: player.physic,
      heightCm: player.heightCm,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pace': pace,
      'shooting': shooting,
      'passing': passing,
      'attacking_crossing': attackingCrossing,
      'dribbling': dribbling,
      'defending': defending,
      'physic': physic,
      'height_cm': heightCm,
    };
  }
}

