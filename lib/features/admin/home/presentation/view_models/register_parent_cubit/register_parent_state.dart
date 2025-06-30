part of 'register_parent_cubit.dart';

sealed class RegisterParentState extends Equatable {
  const RegisterParentState();

  @override
  List<Object> get props => [];
}

final class RegisterParentInitial extends RegisterParentState {
  const RegisterParentInitial();
}

final class RegisterParentLoading extends RegisterParentState {
  const RegisterParentLoading();
}

final class RegisterParentSuccess extends RegisterParentState {
  const RegisterParentSuccess();
}

final class RegisterParentFailure extends RegisterParentState {
  final String message;

  const RegisterParentFailure(this.message);

  @override
  List<Object> get props => [message];
}
