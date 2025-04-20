import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/features/coach/home/data/models/predict_position_input.dart';
import 'package:spectra_sports/features/coach/home/data/repos/coach_home_repo.dart';

part 'position_prediction_state.dart';

class PositionPredictionCubit extends Cubit<PositionPredictionState> {
  final CoachHomeRepo _coachHomeRepo;

  PositionPredictionCubit(this._coachHomeRepo)
      : super(const PositionPredictionInitial());

  Future<void> predictPosition(PredictPositionInput input) async {
    emit(const PositionPredictionLoading());

    final positionEither = await _coachHomeRepo.predictPosition(input);
    positionEither.fold(
      (failure) => emit(PositionPredictionFailure(failure.message)),
      (position) => emit(PositionPredictionSuccess(position)),
    );
  }
}
