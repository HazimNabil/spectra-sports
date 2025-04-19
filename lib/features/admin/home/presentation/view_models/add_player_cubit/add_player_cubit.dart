import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_player_state.dart';

class AddPlayerCubit extends Cubit<AddPlayerState> {
  AddPlayerCubit() : super(const AddPlayerInitial());
}
