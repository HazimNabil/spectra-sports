import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_match_input.dart';
import 'package:spectra_sports/features/admin/home/data/repos/admin_home_repo.dart';

part 'admin_matches_state.dart';

class AdminMatchesCubit extends Cubit<AdminMatchesState> {
  final AdminHomeRepo _adminHomeRepo;

  AdminMatchesCubit(this._adminHomeRepo) : super(const AdminMatchesInitial());

  Future<void> addMatch(AddMatchInput input) async {
    emit(const AdminMatchesLoading());

    final matchEither = await _adminHomeRepo.addMatch(input);
    matchEither.fold(
      (failure) => emit(AdminMatchesFailure(failure.message)),
      (_) => getMatches(input.team1!),
    );
  }

  Future<void> getMatches(String teamId) async {
    emit(const AdminMatchesLoading());

    final matchEither = await _adminHomeRepo.getMatches(teamId);
    matchEither.fold(
      (failure) => emit(AdminMatchesFailure(failure.message)),
      (matches) => emit(AdminMatchesSuccess(matches)),
    );
  }
}
