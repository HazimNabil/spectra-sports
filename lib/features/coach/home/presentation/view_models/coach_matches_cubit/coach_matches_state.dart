part of 'coach_matches_cubit.dart';

@immutable
sealed class CoachMatchesState extends Equatable {
  const CoachMatchesState();

  @override
  List<Object> get props => [];
}

final class CoachMatchesInitial extends CoachMatchesState {
  const CoachMatchesInitial();
}

final class CoachMatchesLoading extends CoachMatchesState {
  const CoachMatchesLoading();
}

final class CoachMatchesSuccess extends CoachMatchesState {
  final List<MatchModel> matches;

  const CoachMatchesSuccess(this.matches);

  @override
  List<Object> get props => [matches];
}

final class CoachMatchesFailure extends CoachMatchesState {
  final String message;

  const CoachMatchesFailure(this.message);

  @override
  List<Object> get props => [message];
}
