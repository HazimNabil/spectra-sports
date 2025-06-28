import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spectra_sports/features/coach/home/data/models/shot_analysis/shot_analysis.dart';
import 'package:spectra_sports/features/coach/home/data/repos/coach_home_repo.dart';

part 'shot_analysis_state.dart';

class ShotAnalysisCubit extends Cubit<ShotAnalysisState> {
  final CoachHomeRepo coachHomeRepo;

  ShotAnalysisCubit(this.coachHomeRepo) : super(const ShotAnalysisInitial());

  Future<void> analyzeShots(File video) async {
    emit(const ShotAnalysisLoading());

    final shotAnalysisEither = await coachHomeRepo.analyzeShots(video);
    shotAnalysisEither.fold(
      (failure) => emit(ShotAnalysisFailure(failure.message)),
      (shotAnalysis) => emit(ShotAnalysisSuccess(shotAnalysis)),
    );
  }
}
