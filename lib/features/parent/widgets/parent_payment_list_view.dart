import 'package:flutter/material.dart';

import 'package:spectra_sports/features/parent/widgets/parent_payment_card.dart';

class ParentPaymentListView extends StatelessWidget {
  const ParentPaymentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 2,
      itemBuilder: (_, __) => const ParentPaymentCard(),
    );
  }
}
