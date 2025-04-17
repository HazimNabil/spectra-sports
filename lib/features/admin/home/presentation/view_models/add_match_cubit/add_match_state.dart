part of 'add_match_cubit.dart';

sealed class AddMatchState extends Equatable {
  const AddMatchState();

  @override
  List<Object> get props => [];
}

final class AddMatchInitial extends AddMatchState {
  const AddMatchInitial();
}

final class AddMatchLoading extends AddMatchState {
  const AddMatchLoading();
}

final class AddMatchSuccess extends AddMatchState {
  const AddMatchSuccess();
}

final class AddMatchFailure extends AddMatchState {
  final String message;

  const AddMatchFailure(this.message);

  @override
  List<Object> get props => [message];
}
