import 'package:spectra_sports/core/utils/typedefs.dart';
import 'package:spectra_sports/features/parent/home/data/models/parent_player_data/parent_player_data.dart';

abstract interface class ParentHomeRepo {
  ApiResult<List<ParentPlayerData>> getPlayersData();
}
