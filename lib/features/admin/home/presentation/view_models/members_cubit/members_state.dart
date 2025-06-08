part of 'members_cubit.dart';

@immutable
sealed class MembersState extends Equatable {
  const MembersState();

  @override
  List<Object> get props => [];
}

final class MembersInitial extends MembersState {
  const MembersInitial();
}

final class MembersLoading extends MembersState {
  const MembersLoading();
}

final class MembersSuccess extends MembersState {
  final List<Player> players;

  const MembersSuccess(this.players);

  @override
  List<Object> get props => [players];
}

final class MembersFailure extends MembersState {
  final String message;

  const MembersFailure(this.message);

  @override
  List<Object> get props => [message];
}
