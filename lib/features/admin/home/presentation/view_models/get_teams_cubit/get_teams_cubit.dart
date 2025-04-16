import 'package:flutter/foundation.dart' show immutable;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/models/team.dart';
import 'package:spectra_sports/features/admin/home/data/repos/admin_home_repo.dart';

part 'get_teams_state.dart';

class GetTeamsCubit extends Cubit<GetTeamsState> {
  final AdminHomeRepo _adminHomeRepo;

  GetTeamsCubit(this._adminHomeRepo) : super(const GetTeamsInitial());

  Future<void> getTeams() async {
    emit(const GetTeamsLoading());

    final teamsEither = await _adminHomeRepo.getTeams();
    teamsEither.fold(
      (failure) => emit(GetTeamsFailure(failure.message)),
      (teams) => emit(GetTeamsSuccess(teams)),
    );
  }
}
