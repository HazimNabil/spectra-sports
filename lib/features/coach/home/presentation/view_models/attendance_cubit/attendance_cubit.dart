import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/features/coach/home/data/models/attendee/attendee.dart';
import 'package:spectra_sports/features/coach/home/data/models/coach_team/coach_team.dart';
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
      (attendance) async {
        final team = await getTeam();
        if (team != null) {
          final attendees = team.players.map((player) {
            return Attendee(
              name: player.shortName!,
              isPresent: attendance.any((attendee) =>
                  attendee.name.toLowerCase() ==
                  player.shortName?.toLowerCase()),
            );
          }).toList();
          emit(AttendanceSuccess(attendees));
        } else {
          emit(const AttendanceFailure('Failed to get team'));
        }
      },
    );
  }

  Future<CoachTeam?> getTeam() async {
    emit(const AttendanceLoading());

    final teamEither = await _coachHomeRepo.getTeam();
    return teamEither.fold<CoachTeam?>(
      (failure) => null,
      (team) => team,
    );
  }
}
