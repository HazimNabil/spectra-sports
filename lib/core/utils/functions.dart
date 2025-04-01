import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/routes/app_router.dart';
import 'package:toastification/toastification.dart';

void navigateByRole(String role, BuildContext context) {
  switch (role) {
    case 'admin':
      context.go(AppRouter.adminHomeRoute);
    case 'coach':
      context.go(AppRouter.coachHomeRoute);
    case 'parent':
      context.go(AppRouter.parentHomeRoute);
  }
}

void showToast({
  required BuildContext context,
  required String title,
  required ToastificationType type,
}) {
  toastification.show(
    context: context,
    title: Text(title),
    type: type,
    style: ToastificationStyle.minimal,
    autoCloseDuration: const Duration(seconds: 3),
  );
}
