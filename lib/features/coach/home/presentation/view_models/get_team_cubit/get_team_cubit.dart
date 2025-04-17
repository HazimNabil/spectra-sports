import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/models/team.dart';

part 'get_team_state.dart';

class GetTeamCubit extends Cubit<GetTeamState> {
  GetTeamCubit() : super(GetTeamInitial());
}
