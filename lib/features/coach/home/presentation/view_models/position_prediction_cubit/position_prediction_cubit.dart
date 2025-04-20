import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'position_prediction_state.dart';

class PositionPredictionCubit extends Cubit<PositionPredictionState> {
  PositionPredictionCubit() : super(const PositionPredictionInitial());
}
