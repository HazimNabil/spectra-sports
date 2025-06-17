import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/features/parent/home/data/models/parent_player_data/parent_player_data.dart';

part 'parent_players_state.dart';

class ParentPlayersCubit extends Cubit<ParentPlayersState> {
  ParentPlayersCubit() : super(ParentPlayersInitial());
}
