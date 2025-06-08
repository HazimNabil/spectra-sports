import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/features/admin/home/data/repos/admin_home_repo.dart';
import 'package:spectra_sports/features/admin/home/data/models/register_coach_body.dart';

part 'register_coach_state.dart';

class RegisterCoachCubit extends Cubit<RegisterCoachState> {
  final AdminHomeRepo _adminHomeRepo;

  RegisterCoachCubit(this._adminHomeRepo) : super(const RegisterCoachInitial());

  Future<void> registerCoach(RegisterCoachBody coach) async {
    emit(const RegisterCoachLoading());

    final result = await _adminHomeRepo.registerCoach(coach);
    result.fold(
      (failure) => emit(RegisterCoachFailure(failure.message)),
      (_) => emit(const RegisterCoachSuccess()),
    );
  }
}
