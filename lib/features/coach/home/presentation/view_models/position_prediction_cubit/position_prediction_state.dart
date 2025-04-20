part of 'position_prediction_cubit.dart';

@immutable
sealed class PositionPredictionState extends Equatable {
  const PositionPredictionState();

  @override
  List<Object> get props => [];
}

final class PositionPredictionInitial extends PositionPredictionState {
  const PositionPredictionInitial();
}

final class PositionPredictionLoading extends PositionPredictionState {
  const PositionPredictionLoading();
}

final class PositionPredictionSuccess extends PositionPredictionState {
  final String position;

  const PositionPredictionSuccess(this.position);

  @override
  List<Object> get props => [position];
}

final class PositionPredictionFailure extends PositionPredictionState {
  final String message;

  const PositionPredictionFailure(this.message);

  @override
  List<Object> get props => [message];
}
