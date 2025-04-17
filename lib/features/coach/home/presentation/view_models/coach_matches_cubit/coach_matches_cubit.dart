import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coach_matches_state.dart';

class CoachMatchesCubit extends Cubit<CoachMatchesState> {
  CoachMatchesCubit() : super(const CoachMatchesInitial());
}
