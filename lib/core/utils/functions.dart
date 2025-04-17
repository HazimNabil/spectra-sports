import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_sports/core/routes/app_router.dart';
import 'package:spectra_sports/features/auth/data/models/user_model.dart';
import 'package:toastification/toastification.dart';

void navigateByRole(UserModel user, BuildContext context) {
  switch (user.role) {
    case 'admin':
      context.go(AppRouter.adminHomeRoute);
    case 'coach':
      context.go(AppRouter.coachHomeRoute, extra: user.id);
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
