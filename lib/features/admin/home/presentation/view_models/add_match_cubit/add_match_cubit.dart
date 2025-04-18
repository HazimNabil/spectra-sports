import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/features/admin/home/data/models/add_match_input.dart';
import 'package:spectra_sports/features/admin/home/data/repos/admin_home_repo.dart';

part 'add_match_state.dart';

class AddMatchCubit extends Cubit<AddMatchState> {
  final AdminHomeRepo _adminHomeRepo;

  AddMatchCubit(this._adminHomeRepo) : super(const AddMatchInitial());

  Future<void> addMatch(AddMatchInput input) async {
    emit(const AddMatchLoading());

    final matchEither = await _adminHomeRepo.addMatch(input);
    matchEither.fold(
      (failure) => emit(AddMatchFailure(failure.message)),
      (_) => emit(const AddMatchSuccess()),
    );
  }
}
