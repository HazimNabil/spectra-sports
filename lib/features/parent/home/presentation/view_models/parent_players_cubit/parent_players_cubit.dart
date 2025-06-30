import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/features/parent/home/data/models/parent_player_data/parent_player_data.dart';
import 'package:spectra_sports/features/parent/home/data/repos/parent_home_repo.dart';

part 'parent_players_state.dart';

class ParentPlayersCubit extends Cubit<ParentPlayersState> {
  final ParentHomeRepo _parentHomeRepo;

  ParentPlayersCubit(this._parentHomeRepo) : super(ParentPlayersInitial());

  Future<void> getPlayersData() async {
    emit(ParentPlayersLoading());

    final result = await _parentHomeRepo.getPlayersData();

    result.fold(
      (failure) => emit(ParentPlayersFailure(failure.message)),
      (playersData) => emit(ParentPlayersSuccess(playersData)),
    );
  }
}
