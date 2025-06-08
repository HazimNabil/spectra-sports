import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_coach_state.dart';

class RegisterCoachCubit extends Cubit<RegisterCoachState> {
  RegisterCoachCubit() : super(const RegisterCoachInitial());
}
