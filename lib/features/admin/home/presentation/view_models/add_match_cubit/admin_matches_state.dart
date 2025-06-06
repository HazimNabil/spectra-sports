part of 'admin_matches_cubit.dart';

sealed class AdminMatchesState extends Equatable {
  const AdminMatchesState();

  @override
  List<Object> get props => [];
}

final class AdminMatchesInitial extends AdminMatchesState {
  const AdminMatchesInitial();
}

final class AdminMatchesLoading extends AdminMatchesState {
  const AdminMatchesLoading();
}

final class AdminMatchesSuccess extends AdminMatchesState {
  final List<MatchModel> matches;

  const AdminMatchesSuccess(this.matches);
}

final class AdminMatchesFailure extends AdminMatchesState {
  final String message;

  const AdminMatchesFailure(this.message);

  @override
  List<Object> get props => [message];
}
