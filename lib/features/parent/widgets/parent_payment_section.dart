import 'package:flutter/material.dart';
import 'package:spectra_sports/core/utils/app_colors.dart';
import 'package:spectra_sports/core/widgets/custom_button.dart';
import 'package:spectra_sports/features/parent/widgets/parent_payment_list_view.dart';

class ParentPaymentSection extends StatelessWidget {
  const ParentPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        const Expanded(
          child: ParentPaymentListView(),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 48),
          child: CustomButton(
            title: 'Pay',
            color: AppColors.highlight,
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 0),
      ],
    );
  }
}
