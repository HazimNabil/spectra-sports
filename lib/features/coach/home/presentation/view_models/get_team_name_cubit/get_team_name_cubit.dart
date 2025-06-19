import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/features/coach/home/data/repos/coach_home_repo.dart';

part 'get_team_name_state.dart';

class GetTeamNameCubit extends Cubit<GetTeamNameState> {
  final CoachHomeRepo _coachHomeRepo;

  GetTeamNameCubit(this._coachHomeRepo) : super(const GetTeamNameInitial());

  Future<void> getTeamName() async {
    emit(const GetTeamNameLoading());

    final teamNameEither = await _coachHomeRepo.getTeam();
    teamNameEither.fold(
      (failure) => emit(GetTeamNameFailure(failure.message)),
      (team) => emit(GetTeamNameSuccess(team.team?.name)),
    );
  }
}
