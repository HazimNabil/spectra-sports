part of 'add_player_cubit.dart';

@immutable
sealed class AddPlayerState extends Equatable {
  const AddPlayerState();

  @override
  List<Object> get props => [];
}

final class AddPlayerInitial extends AddPlayerState {
  const AddPlayerInitial();
}

final class AddPlayerLoading extends AddPlayerState {
  const AddPlayerLoading();
}

final class AddPlayerSuccess extends AddPlayerState {

}

final class AddPlayerFailure extends AddPlayerState {
  final String message;

  const AddPlayerFailure(this.message);

  @override
  List<Object> get props => [message];
}
