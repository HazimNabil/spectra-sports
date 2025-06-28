part of 'shot_analysis_cubit.dart';

sealed class ShotAnalysisState extends Equatable {
  const ShotAnalysisState();

  @override
  List<Object> get props => [];
}

final class ShotAnalysisInitial extends ShotAnalysisState {
  const ShotAnalysisInitial();
}

final class ShotAnalysisLoading extends ShotAnalysisState {
  const ShotAnalysisLoading();
}

final class ShotAnalysisSuccess extends ShotAnalysisState {
  final ShotAnalysis shotAnalysis;

  const ShotAnalysisSuccess(this.shotAnalysis);

  @override
  List<Object> get props => [shotAnalysis];
}

final class ShotAnalysisFailure extends ShotAnalysisState {
  final String message;

  const ShotAnalysisFailure(this.message);

  @override
  List<Object> get props => [message];
}
