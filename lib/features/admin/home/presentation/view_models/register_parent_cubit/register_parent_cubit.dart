import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_parent_state.dart';

class RegisterParentCubit extends Cubit<RegisterParentState> {
  RegisterParentCubit() : super(const RegisterParentInitial());
}
