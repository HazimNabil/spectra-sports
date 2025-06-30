part of 'get_team_name_cubit.dart';

sealed class GetTeamNameState extends Equatable {
  const GetTeamNameState();

  @override
  List<Object?> get props => [];
}

final class GetTeamNameInitial extends GetTeamNameState {
  const GetTeamNameInitial();
}

final class GetTeamNameLoading extends GetTeamNameState {
  const GetTeamNameLoading();
}

final class GetTeamNameSuccess extends GetTeamNameState {
  final String? teamName;

  const GetTeamNameSuccess(this.teamName);

  @override
  List<Object?> get props => [teamName];
}

final class GetTeamNameFailure extends GetTeamNameState {
  final String message;

  const GetTeamNameFailure(this.message);

  @override
  List<Object?> get props => [message];
}
