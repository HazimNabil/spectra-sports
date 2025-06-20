import 'package:flutter/material.dart';

class NotPaidWidget extends StatelessWidget {
  const NotPaidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Not Paid',
      style: TextStyle(fontSize: 32),
    );
  }
}
