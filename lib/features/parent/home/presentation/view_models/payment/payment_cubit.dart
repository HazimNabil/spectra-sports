import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spectra_sports/features/parent/home/data/repos/parent_home_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final ParentHomeRepo _parentHomeRepo;

  PaymentCubit(this._parentHomeRepo) : super(const PaymentInitial());

  Future<void> payFees(double amount) async {
    emit(const PaymentLoading());

    final result = await _parentHomeRepo.payFees(amount);

    result.fold(
      (failure) => emit(PaymentFailure(failure.message)),
      (paymentLink) => emit(PaymentSuccess(paymentLink)),
    );
  }
}
