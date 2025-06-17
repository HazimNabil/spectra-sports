part of 'parent_players_cubit.dart';

sealed class ParentPlayersState extends Equatable {
  const ParentPlayersState();

  @override
  List<Object> get props => [];
}

final class ParentPlayersInitial extends ParentPlayersState {}

final class ParentPlayersLoading extends ParentPlayersState {}

final class ParentPlayersSuccess extends ParentPlayersState {
  final List<ParentPlayerData> playersData;

  const ParentPlayersSuccess(this.playersData);

  @override
  List<Object> get props => [playersData];
}

final class ParentPlayersFailure extends ParentPlayersState {
  final String message;

  const ParentPlayersFailure(this.message);

  @override
  List<Object> get props => [message];
}
