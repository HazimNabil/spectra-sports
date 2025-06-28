import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spectra_sports/features/coach/home/data/models/shot_analysis/shot_analysis.dart';

part 'shot_analysis_state.dart';

class ShotAnalysisCubit extends Cubit<ShotAnalysisState> {
  ShotAnalysisCubit() : super(const ShotAnalysisInitial());
}
