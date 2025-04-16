part of 'get_teams_cubit.dart';

@immutable
sealed class GetTeamsState extends Equatable {
  const GetTeamsState();

  @override
  List<Object> get props => [];
}

final class GetTeamsInitial extends GetTeamsState {
  const GetTeamsInitial();
}

final class GetTeamsLoading extends GetTeamsState {
  const GetTeamsLoading();
}

final class GetTeamsSuccess extends GetTeamsState {
  final List<Team> teams;

  const GetTeamsSuccess(this.teams);

  @override
  List<Object> get props => [teams];
}

final class GetTeamsFailure extends GetTeamsState {
  final String message;

  const GetTeamsFailure(this.message);

  @override
  List<Object> get props => [message];
}
