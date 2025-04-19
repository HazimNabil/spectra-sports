part of 'players_cubit.dart';

@immutable
sealed class PlayersState extends Equatable {
  const PlayersState();

  @override
  List<Object> get props => [];
}

final class PlayersInitial extends PlayersState {
  const PlayersInitial();
}

final class PlayersLoading extends PlayersState {
  const PlayersLoading();
}

final class PlayersSuccess extends PlayersState {
  final List<Player> players;

  const PlayersSuccess(this.players);

  @override
  List<Object> get props => [players];
}

final class PlayersFailure extends PlayersState {
  final String message;

  const PlayersFailure(this.message);

  @override
  List<Object> get props => [message];
}
