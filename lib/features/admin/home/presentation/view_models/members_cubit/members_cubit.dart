import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/models/player.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_player_input.dart';
import 'package:spectra_sports/features/admin/home/data/repos/admin_home_repo.dart';
import 'package:spectra_sports/features/admin/home/data/models/register_coach_body.dart';

part 'members_state.dart';

class MembersCubit extends Cubit<MembersState> {
  final AdminHomeRepo _adminHomeRepo;

  MembersCubit(this._adminHomeRepo) : super(const MembersInitial());

  Future<void> getMembers(String teamName) async {
    emit(const MembersLoading());

    final teamsEither = await _adminHomeRepo.getTeams();
    teamsEither.fold(
      (failure) => emit(MembersFailure(failure.message)),
      (teams) {
        final players =
            teams.where((team) => team.name == teamName).first.players;
        emit(MembersSuccess(players));
      },
    );
  }

  Future<void> addPlayer(AddPlayerInput input) async {
    emit(const MembersLoading());

    final playerEither = await _adminHomeRepo.addPlayer(input);
    playerEither.fold(
      (failure) => emit(MembersFailure(failure.message)),
      (_) => getMembers(input.teamName),
    );
  }

  Future<void> registerCoach(RegisterCoachBody coach) async {
    emit(const MembersLoading());

    final result = await _adminHomeRepo.registerCoach(coach);
    result.fold(
      (failure) => emit(MembersFailure(failure.message)),
      (_) => getMembers(coach.teamId!),
    );
  }
}
