import 'package:spectra_sports/core/models/match_model.dart';

import 'parent_player.dart';

class ParentPlayerData {
  ParentPlayer player;
  List<MatchModel>? matches;

  ParentPlayerData({required this.player, this.matches});

  factory ParentPlayerData.fromJson(Map<String, dynamic> json) {
    return ParentPlayerData(
      player: ParentPlayer.fromJson(json['player'] as Map<String, dynamic>),
      matches: (json['matches'] as List<dynamic>?)
          ?.map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'player': player.toJson(),
      'matches': matches?.map((e) => e.toJson()).toList(),
    };
  }
}
