import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/features/admin/home/data/repos/admin_home_repo.dart';
import 'package:spectra_sports/features/admin/home/data/models/register_parent_body.dart';

part 'register_parent_state.dart';

class RegisterParentCubit extends Cubit<RegisterParentState> {
  final AdminHomeRepo _adminHomeRepo;

  RegisterParentCubit(this._adminHomeRepo) : super(const RegisterParentInitial());

  Future<void> registerParent(RegisterParentBody parent) async {
    emit(const RegisterParentLoading());
    final result = await _adminHomeRepo.registerParent(parent);
    result.fold(
      (failure) => emit(RegisterParentFailure(failure.message)),
      (_) => emit(const RegisterParentSuccess()),
    );
  }
}
