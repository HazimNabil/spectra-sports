import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/features/coach/home/data/models/attendee/attendee.dart';
import 'package:spectra_sports/features/coach/home/data/repos/coach_home_repo.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  final CoachHomeRepo _coachHomeRepo;

  AttendanceCubit(this._coachHomeRepo) : super(const AttendanceInitial());

  Future<void> takeAttendance(File image) async {
    emit(const AttendanceLoading());

    final attendanceEither = await _coachHomeRepo.takeAttendance(image);
    attendanceEither.fold(
      (failure) => emit(AttendanceFailure(failure.message)),
      (attendance) => emit(AttendanceSuccess(attendance)),
    );
  }
}
