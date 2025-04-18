import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/models/match_model.dart';
import 'package:spectra_sports/features/coach/home/data/models/match_result_body.dart';
import 'package:spectra_sports/features/coach/home/data/repos/coach_home_repo.dart';

part 'coach_matches_state.dart';

class CoachMatchesCubit extends Cubit<CoachMatchesState> {
  final CoachHomeRepo _coachHomeRepo;

  CoachMatchesCubit(this._coachHomeRepo) : super(const CoachMatchesInitial());

  Future<void> getMatches() async {
    emit(const CoachMatchesLoading());

    final matchesEither = await _coachHomeRepo.getMatches();
    matchesEither.fold(
      (failure) => emit(CoachMatchesFailure(failure.message)),
      (matches) => emit(CoachMatchesSuccess(matches)),
    );
  }

  Future<void> addMatchResult(MatchResultBody matchResultBody) async {
    emit(const CoachMatchesLoading());

    final matchEither = await _coachHomeRepo.addMatchResult(matchResultBody);
    matchEither.fold(
      (failure) => emit(CoachMatchesFailure(failure.message)),
      (_) => getMatches(),
    );
  }
}
