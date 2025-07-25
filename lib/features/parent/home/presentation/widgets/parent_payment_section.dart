import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/utils/functions.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/parent/home/presentation/view_models/payment/payment_cubit.dart';
import 'package:spectra_sports/features/parent/home/presentation/widgets/not_paid_widget.dart';
import 'package:spectra_sports/features/parent/home/presentation/widgets/paid_widget.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

class ParentPaymentSection extends StatefulWidget {
  const ParentPaymentSection({super.key});

  @override
  State<ParentPaymentSection> createState() => _ParentPaymentSectionState();
}

class _ParentPaymentSectionState extends State<ParentPaymentSection>
    with AutomaticKeepAliveClientMixin {
  bool _isPaid = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _isPaid ? const PaidWidget() : const NotPaidWidget(),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 48),
          child: BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) async {
              if (state is PaymentSuccess) {
                final uri = Uri.parse(state.paymentLink);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                  await Future.delayed(const Duration(seconds: 4));
                  setState(() {
                    _isPaid = true;
                  });
                }
              } else if (state is PaymentFailure) {
                showToast(
                  context: context,
                  title: state.message,
                  type: ToastificationType.error,
                );
              }
            },
            builder: (context, state) {
              return Visibility(
                visible: !_isPaid,
                child: CustomButton(
                  title: 'Pay',
                  color: AppColors.highlight,
                  isLoading: state is PaymentLoading,
                  onPressed: () {
                    context.read<PaymentCubit>().payFees(1000);
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
