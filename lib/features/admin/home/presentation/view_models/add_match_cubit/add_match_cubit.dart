import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_match_state.dart';

class AddMatchCubit extends Cubit<AddMatchState> {
  AddMatchCubit() : super(const AddMatchInitial());
}
