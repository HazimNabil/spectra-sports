import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/models/team.dart';
import 'package:spectra_sports/features/coach/home/data/repos/coach_home_repo.dart';

part 'get_team_state.dart';

class GetTeamCubit extends Cubit<GetTeamState> {
  final CoachHomeRepo _coachHomeRepo;

  GetTeamCubit(this._coachHomeRepo) : super(const GetTeamInitial());

  Future<void> getTeam(String coachId) async {
    emit(const GetTeamLoading());

    final teamEither = await _coachHomeRepo.getTeam(coachId);
    teamEither.fold(
      (failure) => emit(GetTeamFailure(failure.message)),
      (team) => emit(GetTeamSuccess(team)),
    );
  }
}
