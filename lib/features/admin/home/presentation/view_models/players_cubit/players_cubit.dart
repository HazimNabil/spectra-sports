import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/models/player.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_player_input.dart';
import 'package:spectra_sports/features/admin/home/data/repos/admin_home_repo.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  final AdminHomeRepo _adminHomeRepo;

  PlayersCubit(this._adminHomeRepo) : super(const PlayersInitial());

  Future<void> addPlayer(AddPlayerInput input) async {
    emit(const PlayersLoading());

    final playerEither = await _adminHomeRepo.addPlayer(input);
    playerEither.fold(
      (failure) {
        log('Fail in add player');
        emit(PlayersFailure(failure.message));
      },
      (_) => getPlayers(input.teamName),
    );
  }

  Future<void> getPlayers(String teamName) async {
    emit(const PlayersLoading());

    final teamsEither = await _adminHomeRepo.getTeams();
    teamsEither.fold(
      (failure) {
        log('Fail in get players');
        emit(PlayersFailure(failure.message));
      },
      (teams) {
        final players =
            teams.where((team) => team.name == teamName).first.players;
        emit(PlayersSuccess(players));
      },
    );
  }
}
