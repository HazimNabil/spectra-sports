import 'package:flutter/foundation.dart' show immutable;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/models/team.dart';

part 'get_teams_state.dart';

class GetTeamsCubit extends Cubit<GetTeamsState> {
  GetTeamsCubit() : super(const GetTeamsInitial());
}
