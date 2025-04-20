part of 'attendance_cubit.dart';

sealed class AttendanceState extends Equatable {
  const AttendanceState();

  @override
  List<Object> get props => [];
}

final class AttendanceInitial extends AttendanceState {
  const AttendanceInitial();
}

final class AttendanceLoading extends AttendanceState {
  const AttendanceLoading();
}

final class AttendanceSuccess extends AttendanceState {
  final List<Attendee> attendees;

  const AttendanceSuccess(this.attendees);

  @override
  List<Object> get props => [attendees];
}

final class AttendanceFailure extends AttendanceState {
  final String message;

  const AttendanceFailure(this.message);

  @override
  List<Object> get props => [message];
}
