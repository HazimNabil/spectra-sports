part of 'get_team_cubit.dart';

sealed class GetTeamState extends Equatable {
  const GetTeamState();

  @override
  List<Object> get props => [];
}

final class GetTeamInitial extends GetTeamState {
  const GetTeamInitial();
}

final class GetTeamLoading extends GetTeamState {
  const GetTeamLoading();
}

final class GetTeamSuccess extends GetTeamState {
  final CoachTeam team;

  const GetTeamSuccess(this.team);

  @override
  List<Object> get props => [team];
}

final class GetTeamFailure extends GetTeamState {
  final String message;

  const GetTeamFailure(this.message);

  @override
  List<Object> get props => [message];
}
